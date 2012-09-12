require 'test_helper'

class SlideImagesControllerTest < ActionController::TestCase
  setup do
    @slide_image = slide_images(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:slide_images)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create slide_image" do
    assert_difference('SlideImage.count') do
      post :create, slide_image: @slide_image.attributes
    end

    assert_redirected_to slide_image_path(assigns(:slide_image))
  end

  test "should show slide_image" do
    get :show, id: @slide_image
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @slide_image
    assert_response :success
  end

  test "should update slide_image" do
    put :update, id: @slide_image, slide_image: @slide_image.attributes
    assert_redirected_to slide_image_path(assigns(:slide_image))
  end

  test "should destroy slide_image" do
    assert_difference('SlideImage.count', -1) do
      delete :destroy, id: @slide_image
    end

    assert_redirected_to slide_images_path
  end
end
