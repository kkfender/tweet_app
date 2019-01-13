require 'test_helper'

class RetunControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get retun_new_url
    assert_response :success
  end

end
