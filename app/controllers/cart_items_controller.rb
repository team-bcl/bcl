class CartItemsController < ApplicationController
	before_action :authenticate_user!
	def index
		@user = User.find(current_user.id)
		item_ids = CartItem.current_cart_in_item_id @user
		@cart_in_items = Item.where(id: item_ids)
	end
	def create
		@cart_item = CartItem.new(cart_items_params)
		@cart_item.item_id = params[:item_id]
		@cart_item.user_id = current_user.id
		if @cart_item.save
			item = Item.find(params[:item_id])
			item.update(stock: item.stock - @cart_item.count) 
			redirect_to cart_items_path
		else
			redirect_to item_path(params[:item_id])
		end
	end
	# def update
	# 	@cart_item = CartItem.find(params[:id])
	# 	@cart_item.item_id = params[:item_id]
	# 	@cart_item.user_id = current_user.id
	# 	if @cart_item.update(cart_items_params)
	# 		item = Item.find(params[:item_id])
	# 		item.update(stock: item.stock - @cart_item.count) 
	# 		redirect_to cart_items_path
	# 	else
	# 		redirect_to item_path(params[:item_id])
	# 	end
	# end
	def destroy
		# @cart_item = params[:item_id]
		@cart_item = CartItem.find(params[:id])
		item_id = @cart_item.item_id
		cart_count = @cart_item.count
		if @cart_item.delete
			item = Item.find(item_id)
			item.update(stock: item.stock + cart_count)
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
