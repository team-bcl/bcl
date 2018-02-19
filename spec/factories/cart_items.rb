FactoryBot.define do
  factory :cart_item do
  	item_id 1
  	user_id 1
  	count 1
  end
 end




    # t.integer "item_id"
    # t.integer "count"
    # t.integer "user_id"
    # t.datetime "created_at", null: false
    # t.datetime "updated_at", null: false
    # t.integer "order_id", default: 0
    # t.boolean "is_purchase", default: true