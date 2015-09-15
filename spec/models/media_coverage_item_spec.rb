require 'rails_helper'

RSpec.describe MediaCoverageItem, :type => :model do
  fixtures :media_coverage_items
  it "must have a title" do
    mci = MediaCoverageItem.new(title: nil)
    expect(mci).to have_exactly(1).error_on(:title)
  end

  it "must have a valid URL" do
    mci = MediaCoverageItem.new(url: nil)
    expect(mci).to have_exactly(1).error_on(:url)

    mci = MediaCoverageItem.new(url: "not a valid URL")
    expect(mci).to have_exactly(1).error_on(:url)
  end

  it "must have a source" do
    mci = MediaCoverageItem.new(source: nil)
    expect(mci).to have_exactly(1).error_on(:source)
  end
  
  it "must have a unique URL" do
    mci = MediaCoverageItem.new(url: "http://www.constituantecitoyenne.quebec")
    expect(mci).to have_exactly(1).error_on(:url)
  end

  it "must have a valid publication date" do
    mci = MediaCoverageItem.new(published_on: nil)
    expect(mci).to have_exactly(1).error_on(:published_on)

    mci = MediaCoverageItem.new(published_on: "not a valid date")
    expect(mci).to have_exactly(1).error_on(:published_on)   
  end

  it "must have a valid media_type value" do
    mci = MediaCoverageItem.new(media_type: nil)
    expect(mci).to have_exactly(1).error_on(:media_type)

    mci = MediaCoverageItem.new(media_type: "not a valid media_type")
    expect(mci).to have_exactly(1).error_on(:media_type)   
  end  


  it "can be saved to the DB when all fields are valid" do
    mci = MediaCoverageItem.new(title: "Mon titre", url: "http://www.bonjour.com", published_on: Date.today, media_type: "text", source: "Journal XYZ")
    expect(mci).to be_valid
  end
end
