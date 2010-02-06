require 'test_helper'

class SnippetsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:snippets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create snippet" do
    assert_difference('Snippet.count') do
      post :create, :snippet => { }
    end

    assert_redirected_to snippet_path(assigns(:snippet))
  end

  test "should show snippet" do
    get :show, :id => snippets(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => snippets(:one).to_param
    assert_response :success
  end

  test "should update snippet" do
    put :update, :id => snippets(:one).to_param, :snippet => { }
    assert_redirected_to snippet_path(assigns(:snippet))
  end

  test "should destroy snippet" do
    assert_difference('Snippet.count', -1) do
      delete :destroy, :id => snippets(:one).to_param
    end

    assert_redirected_to snippets_path
  end
end
