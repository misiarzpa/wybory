require 'test_helper'

class VoivodshipsControllerTest < ActionController::TestCase
  setup do
    @voivodship = voivodships(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:voivodships)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create voivodship" do
    assert_difference('Voivodship.count') do
      post :create, voivodship: { councilman: @voivodship.councilman, name: @voivodship.name }
    end

    assert_redirected_to voivodship_path(assigns(:voivodship))
  end

  test "should show voivodship" do
    get :show, id: @voivodship
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @voivodship
    assert_response :success
  end

  test "should update voivodship" do
    patch :update, id: @voivodship, voivodship: { councilman: @voivodship.councilman, name: @voivodship.name }
    assert_redirected_to voivodship_path(assigns(:voivodship))
  end

  test "should destroy voivodship" do
    assert_difference('Voivodship.count', -1) do
      delete :destroy, id: @voivodship
    end

    assert_redirected_to voivodships_path
  end
end
