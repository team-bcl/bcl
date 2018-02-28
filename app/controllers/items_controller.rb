class ItemsController < ApplicationController
		before_action :authenticate_user!, only:[:new,:create]
		before_action :admin_only, only:[:new,:create, :edit, :destroy]
		before_action :set_item, only: [:show, :update, :edit, :destroy]
	def new
		@item = Item.new
		10.times{
		@item.track_lists.build
		}
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
		@items =Item.all.order(created_at: 'desc').page(params[:page]).per(12)
					.genres_search(params[:genre].presence)
					.item_name_search(params[:search_word].presence)
	end
	def show
		@item = Item.find(params[:id])
		@tracklists = @item.track_lists
		unless CartItem.cart_in_item(current_user, @item).present?
			@cart_item = CartItem.new
		else
			@cart_item = CartItem.cart_in_item(current_user, @item)
		end
	end
	def edit
	end
	
	def update
		@item.user = current_user
		if @item.update(update_params)
		   redirect_to item_path(@item)
		else
			render 'edit'
		end
	end

	def destroy
		@item.destroy
		redirect_to root_path
	end

	private
	def set_item
		@item = Item.find(params[:id])
	end

	def item_params
		params.require(:item).permit(
		:item_name,:item_name_kana,:price,
		:artist_name,:artist_name_kana,:genres,:release_date,
		:label,:user_id,:stock,:is_available,:item_image,
		track_lists_attributes: [:track_name])
	end
	def update_params
		params.require(:item).permit(
		:item_name,:item_name_kana,:price,
		:artist_name,:artist_name_kana,:genres,:release_date,
		:label,:user_id,:stock,:is_available,:item_image, track_lists_attributes: [:id,:_destroy,:track_name])
	end
	def admin_only
		current_user.admin_flag == true
	end
end

