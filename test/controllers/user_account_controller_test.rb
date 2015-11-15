require 'test_helper'

class UserAccountControllerTest < ActionController::TestCase
  setup do
    @user = users :one
    sign_in @user
  end

  test 'should get edit' do
    get :edit
    assert_response :success
  end

  test 'should post update' do
    original_zone = @user.time_zone

    @request.env['HTTP_REFERER'] = user_account_edit_path
    patch :update, user: {time_zone: ActiveSupport::TimeZone::MAPPING['Prague']}
    @user.reload

    assert_response :redirect

    assert_not_equal original_zone, @user.time_zone
  end

end
