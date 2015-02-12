class AddShorturlToBookmark < ActiveRecord::Migration
  def change
    add_column :bookmarks, :short_url, :string
  end
end
