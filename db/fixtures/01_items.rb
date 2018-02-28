100.times do  |i|
	Item.seed do |item|
		item.id = i + 1
		item.item_name = " #{i}番目のitem"
		item.item_name_kana = "#{i}バンメノitem"
		item.price = "1000 + 1"
		item.artist_name = ['hoge','test','fuga','foo','boo','123'].sample
		item.artist_name_kana = "#{i}バンメノアーティスト"
		item.genres = rand(1..9)
		item.release_date = "2017-12-25"
		item.label = "セミ-"
		item.user_id = i + 1
		item.stock = 0
		item.is_available = 1
		item.item_image = Rails.root.join("public/uploads/noimage.png").open
	end
end
