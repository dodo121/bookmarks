class AddForeingKeyToBookmark < ActiveRecord::Migration
  def change
    add_column :bookmarks, :website_id, :integer
  end
end
