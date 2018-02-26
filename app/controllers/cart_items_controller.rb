class CartItemsController < ApplicationController
	before_action :authenticate_user!
	def index
		@user = User.find(current_user.id)
		item_ids = CartItem.cart_in_items @user
		@cart_in_items = Item.where(id: item_ids)
	end
	def create
		@cart_item = CartItem.new(cart_items_params)
		@cart_item.item_id = params[:item_id]
		@cart_item.user_id = current_user.id
		if @cart_item.save
    		Item.pick(@cart_item)
			redirect_to cart_items_path
		else
			redirect_to item_path(params[:item_id])
		end
	end
	def update
		@cart_item = CartItem.find_by(item_id: params[:item_id],
																	user_id: current_user.id,
																	is_purchase: true)
		Item.back(@cart_item)
		@cart_item.count += params[:count].to_i
		@cart_item.update(item_id: params[:item_id],
											user_id: current_user.id)
		Item.pick(@cart_item)
		redirect_to root_path
	end
	def destroy
		@cart_item = CartItem.find(params[:id])
		cart_item = {item_id: @cart_item.item_id, count: @cart_item.count }
		if @cart_item.delete
			Item.back(cart_item)
			redirect_to root_path
		else
			redirect_to root_path
		end
	end
	private
	def cart_items_params
		params.require(:cart_item).permit(:item_id,:user_id,:count)
	end
end
