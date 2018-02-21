module ItemsHelper
	def purchase_number item
		item.cart_items.map{|f| f.count}.sum
	end
	def subtotal item
		item.price * purchase_number(item)
	end
end
