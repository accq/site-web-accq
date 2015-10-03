require 'rails_helper'

RSpec.describe HiveContact, :type => :model do
  it "is invalid without a name" do
    c = HiveContact.new(full_name: nil)
    expect(c).to have_exactly(1).error_on(:full_name)
  end

  it "is invalid without an email" do
    c = HiveContact.new(email: nil)
    expect(c).to have_exactly(1).error_on(:email)
  end

  it "is invalid when an invalid email is supplied" do
    c = HiveContact.new(email: "Notanemail")
    expect(c).to have_exactly(1).error_on(:email)
  end

  it "is valid when all fields are entered correctly" do
    c = HiveContact.new(full_name: "Hello", email: "iam@valid.com")
    expect(c).to be_valid
  end

end
