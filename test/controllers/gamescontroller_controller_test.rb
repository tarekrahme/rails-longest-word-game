require 'test_helper'

class GamescontrollerControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get gamescontroller_new_url
    assert_response :success
  end

  test "should get score" do
    get gamescontroller_score_url
    assert_response :success
  end

end
