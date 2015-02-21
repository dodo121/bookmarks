class Website < ActiveRecord::Base
  include Searchable
  
  has_many :bookmarks, dependent: :destroy
  
  def display 
    domain
  end
end
