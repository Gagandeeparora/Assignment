class UploadsController < ApplicationController	

	def new
		@upload = Upload.new
	end

	def create
		@upload = Upload.create( upload_params )
		if @upload.save
			redirect_to 
		else
			render 'new'
	end

	private
		def file_params
			params.require(:upload).permit(:picture)
		end
end
