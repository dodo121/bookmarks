module Searchable
  extend ActiveSupport::Concern
  
  module ClassMethods
    def search(search_param)
      results = Array.new
      self.column_names.each do |field|
        next if field == 'id' || field == 'created_at' || field == 'updated_at' || field.include?("_id")
        objects = self.where(["#{field} LIKE ?", "%#{search_param}%"])
        if objects.present?
          results << objects
        end
      end
      results
    end
  end
end