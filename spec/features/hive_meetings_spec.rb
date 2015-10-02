require 'rails_helper'

feature "HiveMeetings", :type => :feature do
  fixtures :all
  
  scenario "An ACRQ page shows the next meeting information" do
    visit "/acrq/#{hives(:vive_le_quebec).id}"  
    expect(page).to have_content("Votre prochaine réunion régionale se tiendra le")
    expect(page).to have_content(hive_meetings(:upcoming_meeting_in_vlq).location)
    expect(page).to have_content(hive_meetings(:upcoming_meeting_in_vlq).address)
    expect(page).to have_content(hive_meetings(:upcoming_meeting_in_vlq).city)
    expect(page).to have_content("Télécharger l'ordre du jour")
  end

  scenario "When there are no upcoming meetings in an ACRQ, a message is displayed to the user" do
    hive_meetings(:upcoming_meeting_in_vlq).destroy
    visit "/acrq/#{hives(:vive_le_quebec).id}"  
    expect(page).to have_content("Aucune réunion n'est prévue")
  end

  scenario "The user can access a page that list the past meetings" do
    visit "/acrq/#{hives(:vive_le_quebec).id}"  
    click_link "past-meetings"
    expect(page).to have_css("table tbody tr", count: 1)
    expect(page).to have_css("table tbody tr:nth-child(1) td:nth-child(1)", text: I18n.l(hive_meetings(:past_meeting_in_vlq).meeting_date, format: :long))
    expect(page).to have_css("table tbody tr:nth-child(1) td:nth-child(2)", text: hive_meetings(:past_meeting_in_vlq).location)    
    expect(page).to have_css("table tbody tr:nth-child(1) td:nth-child(3)", text: "Télécharger le compte-rendu")
  end
end
