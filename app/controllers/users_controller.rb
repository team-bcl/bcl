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

	# def edit
	# 	@user = User.find(params[:id])
	# end

	# def user_params
	# 	# params.require(:user).permit(
	# 	# :first_name,
	# 	# :last_name,
	# 	# :first_name_kana,
	# 	# :last_name_kana,
	# 	# :email,
	# 	# :phone_number,
	# 	# :zip_code,
	# 	# :prefectures,
	# 	# :address_city,
	# 	# :address_building
	# 	# )
	# end
end
