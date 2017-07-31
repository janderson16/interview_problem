require "rails_helper"

describe Api::V1::UsersController do
  it "can get a list of users" do
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
    get '/api/v1/users'

    expect(response).to be_success
    expect(User.count).to eq(3)
  end

  it "can get a single user" do
    user_1 = User.create!(
                          first_name: "Ethel",
                          last_name: "Jones",
                          email: "ethel@mail.com",
                          ssn: "123-45-6789"
                          )
    get "/api/v1/users/#{user_1.id}"

    expect(response).to be_success
    expect(user_1.first_name).to eq("Ethel")
  end

  it "can create an user" do
    params = {
              first_name: "Test",
              last_name: "Test",
              email: "test@mail.com",
              ssn: "123-12-6789"
    }
    post "/api/v1/users", user: params, format: :json
    json_response = JSON.parse(response.body)
    expect(response).to be_success
  end

  it "cannot create a user without all fields" do
    userData = {
       user: {
              first_name: "Test",
              email: "test@mail.com",
              ssn: "123-12-6789"
              }
    }

    post "/api/v1/users", user: userData, format: :json
    json_response = JSON.parse(response.body)
    expect(response.status).to eq(403)
  end
end
