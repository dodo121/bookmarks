class Tag < ActiveRecord::Base
  has_many :taggings, dependent: :restrict_with_error
  has_many :bookmarks, through: :taggings
end
