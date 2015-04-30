require 'test_helper'

class IpnControllerTest < ActionController::TestCase
  test "should get ipn" do
    get :ipn
    assert_response :success
  end

end
