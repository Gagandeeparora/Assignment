class UploadsController < ApplicationController

	def index	
	end	

	def new
		@upload = Upload.new
	end

	def create
		@upload = Upload.create( upload_params )
		if @upload.save
			redirect_to @upload
		else
			render 'new'
		end
	end

	def show	
		@upload = Upload.find(params[:id])	
	end
	
	private
		def upload_params
			params.require(:upload).permit(:name, :avatar)
		end
end
