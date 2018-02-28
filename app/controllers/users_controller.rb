class UsersController < ApplicationController

	def show
		@user = current_user
	end

	def destroy
		@user = User.find(params[:id])

		if @user.destroy
			redirect_to root_url, notice: "User deleted."
		end
	end
	
end
