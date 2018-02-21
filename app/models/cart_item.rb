class CartItem < ApplicationRecord
	belongs_to :user
	belongs_to :item
	belongs_to :order, optional: true

	def self.current_cart_in_item_id user_id
		where(is_purchase: true, user_id: user_id).map(&:item_id)
	end
end
