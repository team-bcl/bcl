class OrdersController < ApplicationController
	  include CartItemsHelper
		before_action :authenticate_user!
	def new
		@order = Order.new
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
		params.require(:order).permit(:total_price,:zip_code,:address,
			:phone_number,:last_name,:first_name,:last_name_kana,
			:first_name_kana)
	end
end
  # create_table "orders", force: :cascade do |t|
  #   t.integer "user_id"
  #   t.integer "total_price"
  #   t.string "zip_code"
  #   t.string "address"
  #   t.string "phone_number"
  #   t.string "last_name"
  #   t.string "first_name"
  #   t.string "last_name_kana"
  #   t.string "first_name_kana"
  #   t.integer "status"
  #   t.datetime "created_at", null: false
  #   t.datetime "updated_at", null: false
  # end