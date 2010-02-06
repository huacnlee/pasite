require 'test_helper'

class LanguagesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:languages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create language" do
    assert_difference('Language.count') do
      post :create, :language => { }
    end

    assert_redirected_to language_path(assigns(:language))
  end

  test "should show language" do
    get :show, :id => languages(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => languages(:one).to_param
    assert_response :success
  end

  test "should update language" do
    put :update, :id => languages(:one).to_param, :language => { }
    assert_redirected_to language_path(assigns(:language))
  end

  test "should destroy language" do
    assert_difference('Language.count', -1) do
      delete :destroy, :id => languages(:one).to_param
    end

    assert_redirected_to languages_path
  end
end
