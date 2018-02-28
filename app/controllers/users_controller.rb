class UsersController < ApplicationController
	# def index
	# 	# admin_flag = false

	# 	if current_user.admin_flag == true
	# 		redirect_to new_admin_user_session_path
			
	# 	else
	# 		# flag.true
	# 		redirect_to users_path
	# 	#if @flag = 
	# 	end
	# end

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
