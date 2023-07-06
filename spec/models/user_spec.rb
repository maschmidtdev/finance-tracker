require 'rails_helper'

RSpec.describe User, type: :model do

  invalid_email_user = User.new(email: "invalid_email")
  valid_user = User.new(first_name: "test", last_name: "user", email: "test@user.com", password: "password")

  it "saves valid user" do
    expect { valid_user.save }.to change(User, :count)
  end

  it "can write full name" do
    expect(valid_user.full_name). eql?("test user")
  end

  it "is not valid with an invalid email" do
    expect(invalid_email_user).not_to be_valid
  end

  it "fails to save with an invalid email" do
    expect { invalid_email_user.save }.not_to change(User, :count)
  end

end
