require 'rails_helper'

describe "can see list of user show page" do
  scenario "from the root" do
    user_1 = User.create!(
                          first_name: "Ethel",
                          last_name: "Jones",
                          email: "ethel@mail.com",
                          ssn: "123-45-6789"
                          )

    visit '/'

    within(".user-row-#{user_1.id}") do
      click_on "View"
    end

    expect(current_path).to eq('/users/1')
    expect(page).to have_content "Ethel"
    expect(page).to have_content "Jones"
    expect(page).to have_content "ethel@mail.com"
    expect(page).to_not have_content "345-67-8901"

  end
end
