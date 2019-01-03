require 'test_helper'

class HogesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @hoge = hoges(:one)
  end

  test "should get index" do
    get hoges_url
    assert_response :success
  end

  test "should get new" do
    get new_hoge_url
    assert_response :success
  end

  test "should create hoge" do
    assert_difference('Hoge.count') do
      post hoges_url, params: { hoge: { age: @hoge.age, name: @hoge.name } }
    end

    assert_redirected_to hoge_url(Hoge.last)
  end

  test "should show hoge" do
    get hoge_url(@hoge)
    assert_response :success
  end

  test "should get edit" do
    get edit_hoge_url(@hoge)
    assert_response :success
  end

  test "should update hoge" do
    patch hoge_url(@hoge), params: { hoge: { age: @hoge.age, name: @hoge.name } }
    assert_redirected_to hoge_url(@hoge)
  end

  test "should destroy hoge" do
    assert_difference('Hoge.count', -1) do
      delete hoge_url(@hoge)
    end

    assert_redirected_to hoges_url
  end
end
