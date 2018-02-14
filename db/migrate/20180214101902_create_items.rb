class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :item_name
      t.string :item_name_kana
      t.integer :price
      t.string :artist_name
      t.string :artist_name_kana
      t.string :item_image_id
      t.integer :genres
      t.date :release_date
      t.string :label
      t.integer :user_id
      t.integer :stock
      t.boolean :is_available

      t.timestamps
    end
  end
end
