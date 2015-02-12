class Bookmark < ActiveRecord::Base
  has_many :taggings
  has_many :tags, through: :taggings
  belongs_to :website
  
  def extract_domain(url)
    domain = URI.parse(url).host.split(".").last(2).join(".")
  end
  
  def all_tags=(names)
    self.tags = names.split(",").map do |name|
      Tag.where(name: name.strip).first_or_create!
    end
  end
  
  def all_tags
    self.tags.map(&:name).join(", ")
  end
end


