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
  		redirect_to @candidate
  		flash[:success] = "New Candidate Profile Created"
  	else
  		render 'new'
  		flash[:notice] = "Error! Try again" 		
  	end		
	end

	def update
		@candidate = Candidate.find(params[:id])
	end

	def show
		@candidate = Candidate.find(params[:id])
		@upload = @candidate.uploads.where( "avatar_content_type LIKE ?", "image%").first
		@upload_last = @candidate.uploads.where( "avatar_content_type LIKE ?", "application%").first
		@interview = @candidate.interviews.paginate(:page => params[:page])
	end

	def upload_image
		@candidate = Candidate.find( params[:candidate_id] )
	end

	def upload_file	
		@candidate = Candidate.find( params[:upload][:candidate_id] )
		# @upload = @candidate.uploads.find_or_initialize_by("avatar_content_type LIKE ?", "image%")
	 #  # @upload = @candidate.uploads.build( upload_params )
	 #  @upload.avatar = params[:upload][:avatar]
		# if @upload.save	
		
		@upload = @candidate.uploads.where("avatar_content_type LIKE ?", "image%").first_or_initialize 
		@upload.avatar = params[:upload][:avatar]
		if @upload.save
			redirect_to @candidate
		end
	end

	def upload_resume
		@candidate = Candidate.find( params[:candidate_id] )
	end

	def upload_resume_file
		@candidate = Candidate.find( params[:upload][:candidate_id] )
		# a = @candidate.uploads.where("avatar_content_type LIKE ?", "image%").first_or_create 
		# 	a.avatar = params[:upload][:avatar]
	  # @upload = @candidate.uploads.build( upload_params )

	  @upload = @candidate.uploads.where("avatar_content_type LIKE ?", "application%").first_or_initialize 
	  @upload.avatar = params[:upload][:avatar]
	 	if @upload.save	
			redirect_to @candidate
		end		
	end

	def download
    @candidate = Candidate.find( params[:candidate_id] )
    @upload_last = @candidate.uploads.last 
    send_file(@upload_last.avatar.path,
        :type => 'application/msword',
        :disposition => 'attachment',
        :url_based_filename => true)
	end

	def edit_image
		@candidate = Candidate.find( params[:candidate_id] )
	end

	def edit_image_file
		# @candidate = Candidate.find( params[:upload][:candidate_id] )
		# @upload = @candidate.uploads.where( "avatar_content_type LIKE ?", "image%").first
	 #  @new_upload = 
	 #  if @upload.save	
		# 	redirect_to @candidate
	end

	private
		def candidate_params
			params.require(:candidate).permit(:name, :email, :phone)
		end

		def upload_params
			params.require(:upload).permit(:name, :avatar)
		end
end
