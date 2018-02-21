class Order < ApplicationRecord
	has_many :cart_item
	belongs_to :user
	enum status:{ deliver: 1, shipment: 2}
end
