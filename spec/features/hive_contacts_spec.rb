require 'rails_helper'

feature "HiveContacts", :type => :feature do
  fixtures :all
  scenario "An ACRQ page shows the contact information" do
    visit "/acrq/#{hives(:vive_le_quebec).id}"      
    expect(page).to have_content(hive_contacts(:georges_in_vlq).full_name)
    expect(page).to have_content(hive_contacts(:georges_in_vlq).email)
    expect(page).to have_content(hive_contacts(:georges_in_vlq).phone)
    expect(page).to have_link("Page Facebook", href: hive_contacts(:georges_in_vlq).fb_page)    
  end

  scenario "When there are no contact in an ACRQ, a message is displayed to the user" do
    hive_contacts(:georges_in_vlq).destroy
    visit "/acrq/#{hives(:vive_le_quebec).id}"  
    expect(page).to have_content("Il n'y a aucun responsable à afficher pour le moment")
  end
end
