class UsersController < ApplicationController

	def index
		@users = User.all - Array(current_user)
	end

	def show
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
  	@user = User.find(params[:user][:user_id])
  	if @user.update_attributes(user_params)
  		redirect_to  all_users_path
  		flash[:notice] = "Successfully Updates"
  	else
  		render 'edit'
  	end
  end

  def delete_user
  	@user = User.find(params[:id])
  	if @user.destroy
  		redirect_to 'index'
  	end
  end

  private

   def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, 
      	:current_password, :first_name, :last_name, :role)
   end
end