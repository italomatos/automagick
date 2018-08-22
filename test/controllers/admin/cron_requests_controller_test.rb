require 'test_helper'

class Admin::CronRequestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin_cron_request = admin_cron_requests(:one)
  end

  test "should get index" do
    get admin_cron_requests_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_cron_request_url
    assert_response :success
  end

  test "should create admin_cron_request" do
    assert_difference('Admin::CronRequest.count') do
      post admin_cron_requests_url, params: { admin_cron_request: { at: @admin_cron_request.at, description: @admin_cron_request.description, http_method: @admin_cron_request.http_method, params: @admin_cron_request.params, periodicity: @admin_cron_request.periodicity, status: @admin_cron_request.status, title: @admin_cron_request.title, url: @admin_cron_request.url, user_id: @admin_cron_request.user_id } }
    end

    assert_redirected_to admin_cron_request_url(Admin::CronRequest.last)
  end

  test "should show admin_cron_request" do
    get admin_cron_request_url(@admin_cron_request)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_cron_request_url(@admin_cron_request)
    assert_response :success
  end

  test "should update admin_cron_request" do
    patch admin_cron_request_url(@admin_cron_request), params: { admin_cron_request: { at: @admin_cron_request.at, description: @admin_cron_request.description, http_method: @admin_cron_request.http_method, params: @admin_cron_request.params, periodicity: @admin_cron_request.periodicity, status: @admin_cron_request.status, title: @admin_cron_request.title, url: @admin_cron_request.url, user_id: @admin_cron_request.user_id } }
    assert_redirected_to admin_cron_request_url(@admin_cron_request)
  end

  test "should destroy admin_cron_request" do
    assert_difference('Admin::CronRequest.count', -1) do
      delete admin_cron_request_url(@admin_cron_request)
    end

    assert_redirected_to admin_cron_requests_url
  end
end
