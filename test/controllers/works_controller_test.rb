require 'test_helper'

class WorksControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get works_index_url
    assert_response :success
  end

  test 'should get new' do
    get works_new_url
    assert_response :success
  end

  test 'should get create' do
    get works_create_url
    assert_response :success
  end

  test 'should get destroy' do
    get works_destroy_url
    assert_response :success
  end
end
