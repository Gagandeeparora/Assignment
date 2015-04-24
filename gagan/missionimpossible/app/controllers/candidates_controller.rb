class CandidatesController < ApplicationController

	def index
		@candidates = Candidate.paginate(:page => params[:page])
	end

	def new	
		@candidate = Candidate.new	
	end

	def create
		@candidate = Candidate.new(candidate_params)
  	if @candidate.save
  		flash[:success] = "New Candidate Profile Created"
  		redirect_to @candidate
  	else
  		render 'new'  		
  	end		
	end

	def show
		@candidate = Candidate.find(params[:id])	
	end

	def upload_image
		
	end

	private
		def candidate_params
			params.require(:candidate).permit(:name, :email, :phone)
		end
end
