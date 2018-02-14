class Order < ApplicationRecord
	has_many :cart_item
	belongs_to :user
end
