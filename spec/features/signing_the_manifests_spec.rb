require 'rails_helper'

feature "SigningTheManifests", :type => :feature do
  fixtures :members
  scenario "A user signs the manifest" do
    visit "/"
    click_link "sign-manifest"
    fill_in "member_name", with: "John Smith"
    fill_in "member_email", with: "something@valid.com"
    fill_in "member_phone", with: "123-123-1234"
    fill_in "member_city", with: "Trois-Rivières"
    fill_in "member_postal_code", with: "A1A 1A1"
    click_button "btn-save"
    expect(page).to have_content("Merci d'avoir signé notre manifeste!")
  end

  scenario "A user doesn't enter a required field" do
    visit "/"
    click_link "sign-manifest"
    fill_in "member_email", with: "not-a-valid-email"
    fill_in "member_phone", with: "123-123-1234"
    fill_in "member_city", with: "Trois-Rivières"
    click_button "btn-save"
    expect(page).to have_css(".has-error", count: 3)
  end

  scenario "Latest signatures should appear on the manifest page" do
    visit "/"
    click_link "sign-manifest"

    expect(page).to have_css("ul#last-signatures li", count: 3)
    expect(page).to have_css("ul#last-signatures li:nth-child(1)", text: "Solange")
    expect(page).to have_css("ul#last-signatures li:nth-child(2)", text: "Marc")
    expect(page).to have_css("ul#last-signatures li:nth-child(3)", text: "Denis")
    expect(page).not_to have_css("ul#last-signatures li", text: "John")
  end

  scenario "User emails, phone numbers and postal codes should not appear on the manifest page" do
    visit "/"
    click_link "sign-manifest"
    expect(page).not_to have_content(members(:solange).email)
    expect(page).not_to have_content(members(:marc).email)
    expect(page).not_to have_content(members(:denis).email)

    expect(page).not_to have_content(members(:solange).postal_code)
    expect(page).not_to have_content(members(:marc).postal_code)
    expect(page).not_to have_content(members(:denis).postal_code)

    expect(page).not_to have_content(members(:solange).phone)
    expect(page).not_to have_content(members(:marc).phone)
    expect(page).not_to have_content(members(:denis).phone)
  end

  scenario "You can access a page with all the signatures" do
    visit "/"
    click_link "sign-manifest"
    click_link "all-signatures"
    expect(page).to have_content("Merci 3 fois pour votre engagement!")
    expect(page).to have_css("table tbody tr", count: 3)

    #test the pagination
    visit "/"
    click_link "sign-manifest"
    Member.per_page = 1
    click_link "all-signatures"
    expect(page).to have_css("table tbody tr", count: 1)
    expect(page).to have_css("ul.pagination li", count: 5) #prev, next as well as a li for each page
  end
end
