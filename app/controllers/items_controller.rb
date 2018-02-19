class ItemsController < ApplicationController
		before_action :authenticate_user!, only:[:new,:create]
		before_action :admin_only, only:[:new,:create]
	def new
		@item = Item.new
	end
	def create
		@item = Item.new(item_params)
		@item.user_id = current_user.id
		if @item.save
			redirect_to root_path
		else
			redirect_to new_item_path
		end
	end
	def index
		@items =Item.all.order(created_at: 'desc')
								.page(params[:page])
	end

	def show
    @cart_item = CartItem.new
		@item = Item.find(params[:id])
		@tracklists = @item.track_lists
	end
	private
	def item_params
	params.require(:item).permit(
		:item_name,:item_name_kana,:price,
		:artist_name,:artist_name_kana,:genres,:release_date,
		:label,:user_id,:stock,:is_available
		)
	end 
	def admin_only
		if current_user.admin_flag == true
			redirect_to root_path
		end
	end
end

