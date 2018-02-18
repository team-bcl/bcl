class ItemsController < ApplicationController
	def index
		@items =Item.all.order(created_at: 'desc')
								.page(params[:page])
	end


	def item_params
	params.require(:item).permit(
		:item_image
		)
	end
end

