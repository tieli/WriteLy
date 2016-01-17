class Article < ActiveRecord::Base
  has_many :comments
  has_many :taggings
  has_many :tags, through: :taggings

  def self.tagged_with(name)
    Tag.find_by_name(name).articles
  end

  def tag_list
    tags.map(&:name).join(", ")
  end

  def tag_list=(name)
    self.tags = name.split(",").map do |n|
      Tag.where(name: n.strip).first_or_create!
    end
  end
end
