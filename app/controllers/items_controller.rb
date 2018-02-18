class ItemsController < ApplicationController
	def index
		@items =Item.all.order(created_at: 'desc')
	end

	def show
		@item = Item.find(params[:id])
		@tracklists = @item.track_lists
	end


	def item_params
	params.require(:item).permit(
		:item_image
		)
	end
end

