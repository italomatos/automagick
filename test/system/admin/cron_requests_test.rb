require "application_system_test_case"

class Admin::CronRequestsTest < ApplicationSystemTestCase
  setup do
    @admin_cron_request = admin_cron_requests(:one)
  end

  test "visiting the index" do
    visit admin_cron_requests_url
    assert_selector "h1", text: "Admin/Cron Requests"
  end

  test "creating a Cron request" do
    visit admin_cron_requests_url
    click_on "New Admin/Cron Request"

    fill_in "At", with: @admin_cron_request.at
    fill_in "Description", with: @admin_cron_request.description
    fill_in "Http Method", with: @admin_cron_request.http_method
    fill_in "Params", with: @admin_cron_request.params
    fill_in "Periodicity", with: @admin_cron_request.periodicity
    fill_in "Status", with: @admin_cron_request.status
    fill_in "Title", with: @admin_cron_request.title
    fill_in "Url", with: @admin_cron_request.url
    fill_in "User", with: @admin_cron_request.user_id
    click_on "Create Cron request"

    assert_text "Cron request was successfully created"
    click_on "Back"
  end

  test "updating a Cron request" do
    visit admin_cron_requests_url
    click_on "Edit", match: :first

    fill_in "At", with: @admin_cron_request.at
    fill_in "Description", with: @admin_cron_request.description
    fill_in "Http Method", with: @admin_cron_request.http_method
    fill_in "Params", with: @admin_cron_request.params
    fill_in "Periodicity", with: @admin_cron_request.periodicity
    fill_in "Status", with: @admin_cron_request.status
    fill_in "Title", with: @admin_cron_request.title
    fill_in "Url", with: @admin_cron_request.url
    fill_in "User", with: @admin_cron_request.user_id
    click_on "Update Cron request"

    assert_text "Cron request was successfully updated"
    click_on "Back"
  end

  test "destroying a Cron request" do
    visit admin_cron_requests_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Cron request was successfully destroyed"
  end
end
