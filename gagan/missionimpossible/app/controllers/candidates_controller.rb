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
		@upload = @candidate.uploads.first
		@upload_last = @candidate.uploads.last 
	end

	def upload_image
		@candidate = Candidate.find( params[:candidate_id] )
	end

	def upload_file	
		@candidate = Candidate.find( params[:upload][:candidate_id] )
	  @upload = @candidate.uploads.build( upload_params )
		if @upload.save	
			redirect_to @candidate
		end
	end

	def upload_resume
		@candidate = Candidate.find( params[:candidate_id] )
	end

	def upload_resume_file
		@candidate = Candidate.find( params[:upload][:candidate_id] )
	  @upload = @candidate.uploads.build( upload_params )
	 		if @upload.save	
			redirect_to @candidate
		end		
	end

	def download
    # send_file '/home/letsgomo/Desktop/gagan/resume.zip', :type=>"application/zip", :x_sendfile=>true
	end

	private
		def candidate_params
			params.require(:candidate).permit(:name, :email, :phone)
		end

		def upload_params
			params.require(:upload).permit(:name, :avatar)
		end
end
