require 'test_helper'

class QuestionnairesControllerTest < ActionController::TestCase
  setup do
    @questionnaire = questionnaires(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:questionnaires)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create questionnaire" do
    assert_difference('Questionnaire.count') do
      post :create, questionnaire: { anaesthetic_experience: @questionnaire.anaesthetic_experience, cared_for: @questionnaire.cared_for, comments: @questionnaire.comments, confident_ability: @questionnaire.confident_ability, pain_management: @questionnaire.pain_management, ponv: @questionnaire.ponv, questions_concerns: @questionnaire.questions_concerns, safe_relaxed: @questionnaire.safe_relaxed, same_anaesthetic: @questionnaire.same_anaesthetic, token: @questionnaire.token }
    end

    assert_redirected_to questionnaire_path(assigns(:questionnaire))
  end

  test "should show questionnaire" do
    get :show, id: @questionnaire
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @questionnaire
    assert_response :success
  end

  test "should update questionnaire" do
    patch :update, id: @questionnaire, questionnaire: { anaesthetic_experience: @questionnaire.anaesthetic_experience, cared_for: @questionnaire.cared_for, comments: @questionnaire.comments, confident_ability: @questionnaire.confident_ability, pain_management: @questionnaire.pain_management, ponv: @questionnaire.ponv, questions_concerns: @questionnaire.questions_concerns, safe_relaxed: @questionnaire.safe_relaxed, same_anaesthetic: @questionnaire.same_anaesthetic, token: @questionnaire.token }
    assert_redirected_to questionnaire_path(assigns(:questionnaire))
  end

  test "should destroy questionnaire" do
    assert_difference('Questionnaire.count', -1) do
      delete :destroy, id: @questionnaire
    end

    assert_redirected_to questionnaires_path
  end
end
