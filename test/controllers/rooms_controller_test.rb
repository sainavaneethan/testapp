require 'test_helper'

class RoomsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "check page title" do
  	get :index
	assert_select 'title', "Testapp"
	assert_select "p" , 1
	assert_select "p > br", 6
  end

end
