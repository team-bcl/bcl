FactoryBot.define do
  factory :item, class: Item do
  	item_name  "test"
  	item_name_kana "テスト"
  	price 2000
  	artist_name "hoge"
  	artist_name_kana "ホゲ"
    item_image_id "1"
    genres 'rock'
    release_date  "2017-12-25"
	  label  "セミ-"
  	stock 10
    user_id 1
	  is_available  1
  end
    factory :invalid_item, class: Item do
    item_name  0
    item_name_kana "テスト"
    price 1000
    artist_name 1000
    artist_name_kana "ホゲ"
    item_image_id "1"
    genres 'rock'
    release_date  "2017-12-25"
    label  "セミ-"
    stock 'hoge'
    user_id 1
    is_available  1
  end
end

