require 'test_helper'

class CommitteeVoivodshipsControllerTest < ActionController::TestCase
  setup do
    @committee_voivodship = committee_voivodships(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:committee_voivodships)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create committee_voivodship" do
    assert_difference('CommitteeVoivodship.count') do
      post :create, committee_voivodship: { committee_id: @committee_voivodship.committee_id, voivodship_id: @committee_voivodship.voivodship_id }
    end

    assert_redirected_to committee_voivodship_path(assigns(:committee_voivodship))
  end

  test "should show committee_voivodship" do
    get :show, id: @committee_voivodship
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @committee_voivodship
    assert_response :success
  end

  test "should update committee_voivodship" do
    patch :update, id: @committee_voivodship, committee_voivodship: { committee_id: @committee_voivodship.committee_id, voivodship_id: @committee_voivodship.voivodship_id }
    assert_redirected_to committee_voivodship_path(assigns(:committee_voivodship))
  end

  test "should destroy committee_voivodship" do
    assert_difference('CommitteeVoivodship.count', -1) do
      delete :destroy, id: @committee_voivodship
    end

    assert_redirected_to committee_voivodships_path
  end
end
