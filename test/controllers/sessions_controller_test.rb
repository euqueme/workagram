require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test 'should get new' do
    get sessions_: new_url
    assert_response :success
  end

  test 'should get create' do
    get sessions_: create_url
    assert_response :success
  end

  test 'should get destroy' do
    get sessions_: destroy_url
    assert_response :success
  end
end
