100.times do  |i|
	Item.seed do |item|
		item.id = i + 1
		item.item_name = " #{i}番目のitem"
		item.item_name_kana = "#{i}バンメノitem"
		item.price = "1000 + 1"
		item.artist_name = "#{i}番目のアーティスト"
		item.artist_name_kana = "#{i}バンメノアーティスト"
		item.genres = rand(0..9)
		item.release_date = "2017-12-25"
		item.label = "セミ-"
		item.user_id = i + 1
		item.stock = 3
		item.is_available = 1
		item.item_image = Rails.root.join("public/uploads/noimage.png").open
	end
end
