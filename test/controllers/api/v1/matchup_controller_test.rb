require 'test_helper'

class Api::V1::MatchupControllerTest < ActionController::TestCase
  test "should get compare" do
    get :compare
    assert_response :success
  end

end
