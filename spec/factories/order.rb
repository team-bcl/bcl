FactoryBot.define do
  factory :order do
  	user_id 1
  	zip_code '123-4567'
  	address '1丁目1番'
  	phone_number '123-4567-1234'
  end
 end
 
 
   # create_table "orders", force: :cascade do |t|
  #   t.integer "user_id"
  #   t.integer "total_price"
  #   t.string "zip_code"
  #   t.string "address"
  #   t.string "phone_number"
  #   t.string "last_name"
  #   t.string "first_name"
  #   t.string "last_name_kana"
  #   t.string "first_name_kana"
  #   t.integer "status"
  #   t.datetime "created_at", null: false
  #   t.datetime "updated_at", null: false
  # end