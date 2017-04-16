class RoomsController < ApplicationController
	include RoomsHelper
  def index
  	 #load from test input file
  	 @result = get_result
  end

  def file_upload
  	uploaded_file =  params[:file]
  	if uploaded_file.present?
  		file_content = uploaded_file.tempfile.readlines
  		@result = get_result_for_txt(file_content)
  	else
  		flash[:error] = "file empty"
  		redirect_to root_path
  	end
  end
end
