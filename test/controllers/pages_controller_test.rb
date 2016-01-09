require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  test "should get team" do
    get :team
    assert_response :success
  end

end
