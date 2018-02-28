module ItemsHelper
	def purchase_number item
		item.cart_items.map{|f| f.count}.sum
	end
	def subtotal item
		item.price * purchase_number(item)
	end
	def cart_in_item_present?
		current_user.cart_items.where( is_purchase: true, user_id: current_user).any? { |w| w.item_id == @item.id}
	end
end
