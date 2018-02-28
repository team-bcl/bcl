class CartItem < ApplicationRecord
	belongs_to :user
	belongs_to :item
	belongs_to :order, optional: true
	validates :count, presence:true,numericality: {only_integer: true, greater_than: 0 }
	def self.cart_in_items user_id
		where( is_purchase: true, user_id: user_id)
	end
	def self.cart_in_items_id user_id
		where( is_purchase: true, user_id: user_id).map(&:item_id)
	end
	def self.purchase order
		 cart_in_items(order.user_id).map{|c| c.update(is_purchase: false, order_id: order.id)}
	end
	def self.order_history user_id
		where( is_purchase: false, user_id: user_id)
	end
end
