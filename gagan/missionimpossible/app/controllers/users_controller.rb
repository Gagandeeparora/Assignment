class UsersController < ApplicationController

	def index
		@users = User.paginate(:page => params[:page]) - [current_user]
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
  		flash[:success] = "Successfully Updates"
  	else
  		render 'edit'
  	end
  end

  def delete_user
  	@user = User.find(params[:id])
  	if @user.destroy
  		redirect_to all_users_path
  	end
  end

  def assign_candidate
    @users = User.where(role: "user")
    @candidates = Candidate.paginate(:page => params[:page])
  end

  def assign_recruiter_to_candidates
    @user = User.find(params[:user_id])
    if @candidates = Candidate.find(params[:candidates_id])
      @user.candidates << @candidates 
      redirect_to interview_schedule_path
      flash[:success] = "Candidate added"
    else
      render assign_candidate_path
    end   
  end

  def list_of_candidates
    @candidates = Candidate.paginate(:page => params[:page])
  end

  def interview_schedule
    @candidates = Candidate.paginate(:page => params[:page])
    @users = User.where(role: "user")
  end

  def interview_fixed
    @candidate = Candidate.find(params[:candidate_id])
    # @user = User.find(params[:user_id])
    # require "pry"; binding.pry
    datetime = DateTime.new(params[:start_datetime]["datetime(1i)"].to_i, 
                        params[:start_datetime]["datetime(2i)"].to_i,
                        params[:start_datetime]["datetime(3i)"].to_i,
                        params[:start_datetime]["datetime(4i)"].to_i,
                        params[:start_datetime]["datetime(5i)"].to_i)
    # logger.info "====#{datetime}"
    @interview = @candidate.interviews.build(user_id: params[:user_id], 
      dateandtime: datetime )
    if @interview.save
      redirect_to candidates_list_path
    end
  end

  private

   def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, 
      	:current_password, :first_name, :last_name, :role)
   end

   def interview_params
     params.require(:interview).permit(:dateandtime, :user_id)
   end
end