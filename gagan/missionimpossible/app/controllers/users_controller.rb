class UsersController < ApplicationController

	def index
		@users = User.all 
	end

	def show
  end

  def edit
  	@users = User.find(params[:id])
  end

  def update
  	@user.update_attributes(params[:user])
  	@user = User.find(params[:id])
  	@user.save
  	if @user.save
  		redirect_to  all_users_path
  		flash[:notice] = "Successfully Updates"
  	else
  		render 'edit'
  	end
  end
end
