require 'test_helper'

class SimusControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get simus_new_url
    assert_response :success
  end

end
