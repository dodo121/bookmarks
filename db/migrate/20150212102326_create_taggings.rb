class CreateTaggings < ActiveRecord::Migration
  def change
    create_table :taggings do |t|
      t.belongs_to :bookmark, index: true
      t.belongs_to :tag, index: true

      t.timestamps null: false
    end
    add_foreign_key :taggings, :bookmarks
    add_foreign_key :taggings, :tags
  end
end
