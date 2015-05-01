require 'test_helper'

class AdminControllerTest < ActionController::TestCase
  test "should be denied" do
    get :index
    assert_response :forbidden
  end
end
