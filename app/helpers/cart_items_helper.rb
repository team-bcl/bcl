module CartItemsHelper
	def total_price user_id
		cart_in_items = CartItem.cart_in_items(user_id)
		#cart_in_itemメソッドはcart_item.rb　に記載
		result = cart_in_items.map{|c| c.count*c.item.price}.sum
		return result
	end
end
