require 'test_helper'

class SimuControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get simu_new_url
    assert_response :success
  end

end
