FactoryBot.define do
  factory :order, class: Order do
  	zip_code '123-4567'
  	phone_number '123-4567-1234'
    last_name 'hoge'
    last_name_kana 'hoge'
    first_name 'hoge'
    first_name_kana 'hoge'
    status 1
    prefectures '北海道'
    address_city 'hoge'
    address_building 'hoge'
  end
  factory :invalid_order, class: Order do
    user_id 1
    zip_code '123-4567'
    address '1丁目1番'
    phone_number '123-4567-1234'
  end
 end