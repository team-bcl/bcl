class User < ApplicationRecord
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable,
	     :recoverable, :rememberable, :trackable, :validatable
	     
	has_many :orders
	has_many :items
	has_many :cart_items

	include JpPrefecture
	jp_prefecture :prefectures

end
