require 'test_helper'

class Api::V1::ErrataControllerTest < ActionController::TestCase
  test "should get stats" do
    get :stats
    assert_response :success
  end

end
