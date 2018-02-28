FactoryBot.define do
  factory :cart_item, class: CartItem do
  	item_id 1
  	user_id 1
  	count 1
  end
  factory :invalid_cart_item, class: CartItem do
  	item_id 1
  	user_id 1
  	# count nil
  end
 end