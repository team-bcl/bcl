class Item < ApplicationRecord
	belongs_to :user
	has_many :track_lists
	has_many :cart_items

	attachment :item_image

end


