class Order < ApplicationRecord
	has_many :cart_items
	belongs_to :user
	enum status:{ deliver: 1, shipment: 2}
end
