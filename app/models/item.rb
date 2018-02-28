class Item < ApplicationRecord
	validates :item_name, presence:true
	validates :item_name_kana, presence:true
	validates :price, presence: true,numericality: {only_integer: true, greater_than: 0 }
	validates :stock, presence: true,numericality: {only_integer: true, greater_than_or_equal: 0 }
	validates :artist_name, presence:true
	validates :artist_name_kana, presence:true
	belongs_to :user
	has_many :track_lists, inverse_of: :item
	accepts_nested_attributes_for :track_lists, reject_if: :all_blank,allow_destroy: true
	has_many :cart_items


	attachment :item_image
	enum genres:{
		rock: 1,pop: 2, yougaku: 3, enka: 4, sample5: 5, sample6: 6,
		sample7: 7, sample8: 8, sample9: 9 
	}
	scope :item_name_search, ->(search_word){
		unless search_word.nil?
			relation = Item.joins(:track_lists)
			relation.merge(TrackList.where("track_name like '%#{search_word}%'").distinct)
				.or(relation.where("items . artist_name like '%#{search_word}%'").distinct)
			  	.or(relation.where("items . item_name like '%#{search_word}%'").distinct)
		end
	}
	scope :genres_search, ->(genres){
		unless genres.nil?
			 Item.where("genres IN (?)", genres)
		end
	}
	def self.pick(cart_item)
			item = self.find(cart_item[:item_id])
			item.update(stock: item.stock - cart_item[:count] )
			binding.pry 	
	end
	def self.back(cart_item)
			item = self.find(cart_item[:item_id])
			item.update(stock: item.stock + cart_item[:count] ) 	
	end
end


