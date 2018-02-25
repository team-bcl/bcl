class OrdersController < ApplicationController
	  include CartItemsHelper
		before_action :authenticate_user!
	def new
		u = current_user
		@order = Order.new(
			zip_code: u.zip_code,
			phone_number: u.phone_number,
			last_name: u.last_name,
			first_name: u.first_name,
			last_name_kana: u.last_name_kana,
			first_name_kana: u.first_name_kana,
			prefectures: u.prefectures,
			address_city: u.address_city,
			address_building: u.address_building
			)
		# @order = Marshal.load(Marshal.dump(current_user))
	end
	def create
		@order = Order.new(order_params)
		@order.user_id = current_user.id
		@order.total_price = total_price(current_user.id)
		#total_priceメソッドはcartitemshelperに記載
		@order.status = 1
		if @order.save
			CartItem.purchase(@order)
			#purchaseメソッドはcartitem.rbに記載
			redirect_to root_path
		else
			redirect_to root_path
		end
	end
	def index
		
	end
	private
	def order_params
		params.require(:order).permit(:total_price,:zip_code,
			:phone_number,:last_name,:first_name,:last_name_kana,
			:first_name_kana,:prefectures, :address_city, :address_building)
	end
end
