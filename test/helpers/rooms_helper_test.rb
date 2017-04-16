require 'test_helper'

class RoomsHelperTest < ActionView::TestCase

	test "should return output arry format" do
    	result = get_result
    	assert_kind_of(Array , result)
  	end

  	test "check output length" do
    	result = get_result
    	result_input1 = get_result("input1.txt")
    	assert_equal(result.length , 6 , "Not equal")
    	assert_equal(result_input1.length , 1 , "Not equal")
  	end

  	 test "check output room ascending order" do
    	result = get_result
    	result = result.collect { |a| a.split(",")[0] }
    	assert_equal(result[0] , "Room 0" , "check first element data")
    	assert_equal(result , result.sort , "Not ascending order")
  	end


end
