require 'rails_helper'

describe "can(not) create a user", :js => :true  do
  scenario "when all necessary fields are filled in" do

    visit '/'

    fill_in "user[first_name]", with: "Jane"
    fill_in "user[last_name]", with: "Doe"
    fill_in "user[email]", with: "jane@mail.com"
    fill_in "user[ssn]", with: "123-12-1234"

    click_on "Create User"

    wait = Selenium::WebDriver::Wait.new ignore: Selenium::WebDriver::Error::NoAlertPresentError
    alert = wait.until { page.driver.browser.switch_to.alert }
    alert.accept

    expect(page).to have_content "Jane"
    expect(page).to have_content "Doe"
    expect(page).to have_content "jane@mail.com"
    expect(page).to_not have_content "123-12-1234"
  end

  scenario "and do not fill in email correctly" do
    visit '/'

    fill_in "user[first_name]", with: "Jane"
    fill_in "user[last_name]", with: "Smith"
    fill_in "user[email]", with: "jane@mail"
    fill_in "user[ssn]", with: "123-12-1234"

    click_on "Create User"

    wait = Selenium::WebDriver::Wait.new ignore: Selenium::WebDriver::Error::NoAlertPresentError
    alert = wait.until { page.driver.browser.switch_to.alert }
    alert.accept

    expect(page).to_not have_content "Smith"
  end

  scenario "and do not fill in ssn correctly" do
    visit '/'

    fill_in "user[first_name]", with: "Jane"
    fill_in "user[last_name]", with: "Smith"
    fill_in "user[email]", with: "jane@mail.com"
    fill_in "user[ssn]", with: "123-12-123"

    click_on "Create User"

    wait = Selenium::WebDriver::Wait.new ignore: Selenium::WebDriver::Error::NoAlertPresentError
    alert = wait.until { page.driver.browser.switch_to.alert }
    alert.accept

    expect(page).to_not have_content "Smith"
  end
end
