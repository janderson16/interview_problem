require 'rails_helper'

describe "can see list of users" do
  scenario "from the root" do
    user_1 = User.create!(
                          first_name: "Ethel",
                          last_name: "Jones",
                          email: "ethel@mail.com",
                          ssn: "123-45-6789"
                          )
    user_2 = User.create!(
                          first_name: "Cledus",
                          last_name: "Jones",
                          email: "cledus@mail.com",
                          ssn: "345-67-8901"
                          )

    visit '/'

    within(".user-row-#{user_1.id}") do
      expect(page).to have_content "Ethel"
      expect(page).to have_content "Jones"
      expect(page).to have_content "ethel@mail.com"
      expect(page).to_not have_content "345-67-8901"
    end

    within(".user-row-#{user_2.id}") do
      expect(page).to have_content "Cledus"
      expect(page).to have_content "Jones"
      expect(page).to have_content "cledus@mail.com"
      expect(page).to_not have_content "123-45-6789"
    end
  end
end
