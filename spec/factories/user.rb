FactoryBot.define do
  factory :user, class: User do
    first_name  "test"
    # last_name "hoge"
    first_name_kana "カナ"
    last_name "ホゲ"
    zip_code "123-4567"
    address "test"
    phone_number '123-4567-8900'
  	email  "test@test"
  	password  "123456"
  end
  factory :admin, class: User  do
    first_name  "admin"
    # last_name "fuga"
    first_name_kana "アドミン"
    last_name "フガ"
    zip_code "000-0000"
    address "admin"
    phone_number '000-0000-0000'
    email  "admin@admin"
    password  "000000"
    admin_flag false
  end
end

