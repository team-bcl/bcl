class UsersController < ApplicationController

	def show
		@user = current_user
		@order_history = CartItem.order_history @user
		# binding.pry
	end

	def destroy
		@user = User.find(params[:id])

		if @user.destroy
			redirect_to root_url, notice: "User deleted."
		end
	end
	
end
