require 'rails_helper'

RSpec.describe Hive, :type => :model do
  fixtures :hives
  it "is invalid without a name" do
    hive = Hive.new(hive_with_missing_required_fields)
    expect(hive).to have_exactly(1).error_on(:name)
  end

  it "is invalid without a number" do
    hive = Hive.new(hive_with_missing_required_fields)    
    expect(hive).to have_at_least(1).error_on(:number)
  end

  it "is invalid if the specified name has already been taken" do
    hive = Hive.new(hive_with_valid_fields.merge(name: hives(:vive_le_quebec).name))
    expect(hive).to have_exactly(1).error_on(:name)
  end

  it "is invalid if the number is not an integer" do
    hive=Hive.new(hive_with_valid_fields.merge(number: 2.12))
    expect(hive).to have_exactly(1).error_on(:number)
  end

  it "is invalid if the number specified has already been taken" do
    Hive.create(hive_with_valid_fields)    
    hive = Hive.new(hive_with_valid_fields)
    expect(hive).to have_exactly(1).error_on(:number)
  end

  it "can be saved if all fields are valid" do
    hive = Hive.new(hive_with_valid_fields)
    expect(hive).to be_valid
  end

  private
  def hive_with_missing_required_fields
    {
      name: nil,
      number: nil
    }
  end

  def hive_with_valid_fields
    {
      name: "A new hive",
      number: 2     
    }
  end

end
