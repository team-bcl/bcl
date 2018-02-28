class Order < ApplicationRecord
	has_many :cart_items
	belongs_to :user
	validates :total_price, presence: true
	validates :zip_code, presence: true
	validates :phone_number, presence: true
	validates :last_name, presence: true
	validates :last_name_kana, presence:true
	validates :first_name, presence:true
	validates :first_name_kana, presence: true
	validates :prefectures, presence: true
	validates :address_city, presence: true
	validates :address_building, presence: true 
	enum status:{ deliver: 1, shipment: 2}

	include JpPrefecture
	jp_prefecture :prefectures
end
