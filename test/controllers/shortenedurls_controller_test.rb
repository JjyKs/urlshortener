require 'test_helper'

class ShortenedurlsControllerTest < ActionController::TestCase
  setup do
    @shortenedurl = shortenedurls(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:shortenedurls)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create shortenedurl" do
    assert_difference('Shortenedurl.count') do
      post :create, shortenedurl: { original: @shortenedurl.original, shortened: @shortenedurl.shortened }
    end

    assert_redirected_to shortenedurl_path(assigns(:shortenedurl))
  end

  test "should show shortenedurl" do
    get :show, id: @shortenedurl
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @shortenedurl
    assert_response :success
  end

  test "should update shortenedurl" do
    patch :update, id: @shortenedurl, shortenedurl: { original: @shortenedurl.original, shortened: @shortenedurl.shortened }
    assert_redirected_to shortenedurl_path(assigns(:shortenedurl))
  end

  test "should destroy shortenedurl" do
    assert_difference('Shortenedurl.count', -1) do
      delete :destroy, id: @shortenedurl
    end

    assert_redirected_to shortenedurls_path
  end
end
