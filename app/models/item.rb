class Item < ApplicationRecord
	belongs_to :user
	has_many :track_lists
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
end


