class Website < ActiveRecord::Base
  has_many :bookmarks, dependent: :destroy
end
