require 'test_helper'

class WebrtcControllerTest < ActionController::TestCase
  test "should get echo" do
    get :echo
    assert_response :success
  end

end
