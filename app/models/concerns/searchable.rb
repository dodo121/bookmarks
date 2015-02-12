module Searchable
  extend ActiveSupport::Concern
  
  module ClassMethods
    def search(search_param)
      results = self.where(nil)
      self.column_names.each do |field|
        results << self.where(["#{field} LIKE ?", "%#{search_param}%"])
      end
      results
    end
  end
end