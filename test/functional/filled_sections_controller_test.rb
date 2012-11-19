require 'test_helper'

class FilledSectionsControllerTest < ActionController::TestCase
  setup do
    @filled_section = filled_sections(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:filled_sections)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create filled_section" do
    assert_difference('FilledSection.count') do
      post :create, filled_section: @filled_section.attributes
    end

    assert_redirected_to filled_section_path(assigns(:filled_section))
  end

  test "should show filled_section" do
    get :show, id: @filled_section
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @filled_section
    assert_response :success
  end

  test "should update filled_section" do
    put :update, id: @filled_section, filled_section: @filled_section.attributes
    assert_redirected_to filled_section_path(assigns(:filled_section))
  end

  test "should destroy filled_section" do
    assert_difference('FilledSection.count', -1) do
      delete :destroy, id: @filled_section
    end

    assert_redirected_to filled_sections_path
  end
end
