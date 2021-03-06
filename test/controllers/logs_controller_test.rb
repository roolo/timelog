require 'test_helper'

class LogsControllerTest < ActionController::TestCase
  setup do
    @log = logs(:one)
    sign_in @log.user
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:logs)
  end

  test 'should list our item' do
    get :index
    assert_includes @response.body, @log.title
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create log' do
    assert_difference('Log.count') do
      @request.env['HTTP_REFERER'] = logs_path
      post :create, log: { title: @log.title, user_id: @log.user_id }
    end

    assert_redirected_to logs_path
  end

  test 'should show log' do
    get :show, id: @log
    assert_response :success
  end

  test 'should get edit' do
    get :edit, id: @log
    assert_response :success
  end

  test 'should update log' do
    @request.env['HTTP_REFERER'] = logs_path
    patch :update, id: @log, log: { title: @log.title, user_id: @log.user_id }
    assert_redirected_to logs_path
  end

  test 'should destroy log' do
    assert_difference('Log.count', -1) do
      delete :destroy, id: @log
    end

    assert_redirected_to logs_path
  end
end
