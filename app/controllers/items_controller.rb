class ItemsController < ApplicationController
		before_action :authenticate_user!, only:[:new,:create]
		#before_action :admin_only, only:[:new,:create]
		before_action :set_item, only: [:show, :update, :edit, :delete]
	def new
		@item = Item.new
		10.times{
		@item.track_list.build
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
		@cart_item = CartItem.new
		@item = Item.find(params[:id])
		@tracklists = @item.track_lists
		if current_user.present?
			@cart_items = current_user.cart_items
			@cart_item_id = @cart_items.pluck(:item_id)
		end
	end
	def edit
	end
	
	def update
		@item.update(item_params)
		redirect_to root_path
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
		:label,:user_id,:stock,:is_available,:item_image, track_lists_attributes: [:id,:_destroy,:track_name])
	end 
	def admin_only
		if current_user.admin_flag == true
			redirect_to root_path
		end
	end
end

