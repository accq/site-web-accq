require 'rails_helper'

RSpec.describe Member, :type => :model do
  it "is invalid when a required field is missing" do
    m = Member.new(member_with_missing_required_fields)
    expect(m).to have_exactly(1).error_on(:name)
    expect(m).to have_at_least(1).error_on(:email)
    expect(m).to have_exactly(1).error_on(:postal_code)
  end

  it "is invalid when an incorrect email is specified" do
    m = Member.new(member_with_valid_fields.merge(email: "Imnotvalid"))
    expect(m).to have_exactly(1).error_on(:email)
  end

  it "is invalid when the email address is already taken" do
    Member.create(member_with_valid_fields)
    m = Member.new(member_with_valid_fields)
    expect(m).to have_exactly(1).error_on(:email)
  end

  it "can be saved when all fields are valid" do
    m = Member.new(member_with_valid_fields)
    expect(m).to be_valid    
  end

  it "doesn't set confirmed_at field at creation" do
    m = Member.new(member_with_valid_fields)
    m.save
    expect(m.confirmed_at).to be_nil
    expect(m).to be_persisted #just to make sure that the record has still been correctly created in the database
  end

  private
  def member_with_missing_required_fields
    {
      name: nil,
      email: nil,
      postal_code: nil
    }
  end

  def member_with_valid_fields
    {
      name: "John Smith",
      email: "john.smith@gmail.com",
      postal_code: "H1H 1H1"
    }
  end
end
