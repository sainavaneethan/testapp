class RoomsController < ApplicationController
	include RoomsHelper
  def index
  	 @result = get_result
  end
end
