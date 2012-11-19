require 'test_helper'

class DocuchecksControllerTest < ActionController::TestCase
  setup do
    @docucheck = docuchecks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:docuchecks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create docucheck" do
    assert_difference('Docucheck.count') do
      post :create, docucheck: @docucheck.attributes
    end

    assert_redirected_to docucheck_path(assigns(:docucheck))
  end

  test "should show docucheck" do
    get :show, id: @docucheck
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @docucheck
    assert_response :success
  end

  test "should update docucheck" do
    put :update, id: @docucheck, docucheck: @docucheck.attributes
    assert_redirected_to docucheck_path(assigns(:docucheck))
  end

  test "should destroy docucheck" do
    assert_difference('Docucheck.count', -1) do
      delete :destroy, id: @docucheck
    end

    assert_redirected_to docuchecks_path
  end
end
