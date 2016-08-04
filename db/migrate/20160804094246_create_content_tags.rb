class CreateContentTags < ActiveRecord::Migration
  def change
    create_table :content_tags do |t|
      t.integer :content_id
      t.string :tag_content
      t.string :url

      t.timestamps null: false
    end
  end
end
