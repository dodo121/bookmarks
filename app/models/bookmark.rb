class Bookmark < ActiveRecord::Base
  has_many :taggings
  has_many :tags, through: :taggings
  belongs_to :website
end
