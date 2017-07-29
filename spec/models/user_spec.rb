require 'rails_helper'

describe User do
  it "user can be created" do
    user = User.create(email: "john_doe@mail.com",
                       first_name: "John",
                       last_name: "Doe",
                       ssn: "123-45-6789"
                       )
    expect(user).to be_valid
  end

  it "user cannot be created with missing field" do
    user = User.create(email: "john_doe@mail.com",
                       first_name: "John",
                       last_name: "Doe"
                       )
    expect(user).to_not be_valid
  end

  it "user cannot be created with invalid email address" do
    user = User.create(email: "john_doe@mail",
                       first_name: "John",
                       last_name: "Doe",
                       ssn: "123-45-6789"
                       )

    expect(user).to_not be_valid
  end
end
