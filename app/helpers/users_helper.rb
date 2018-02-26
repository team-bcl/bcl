module UsersHelper
	def user_item_total_fee user
		user.cart_items.map {|f| 
			if f.is_purchase == true
				f.item.price * f.count
			else
				nil.to_i
			end
		}.sum
	end
end
