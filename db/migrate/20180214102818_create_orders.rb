class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.integer :total_price
      t.string :zip_code
      t.string :address
      t.string :phone_number
      t.string :last_name
      t.string :first_name
      t.string :last_name_kana
      t.string :first_name_kana
      t.integer :status

      t.timestamps
    end
  end
end
