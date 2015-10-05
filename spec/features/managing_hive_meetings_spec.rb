require 'rails_helper'

feature "ManagingHiveMeetings", :type => :feature do
  fixtures :all

  scenario "Add a new meeting" do
    connect(users(:the_admin))
    visit "/admin/hives"
    click_link "Réunions"
    click_link "add-meeting"

    fill_in :hive_meeting_location, with: "Chez nous"
    fill_in :hive_meeting_city, with: "Trois-Rivières"
    fill_in :hive_meeting_address, with: "2020 du finfin"
    fill_in :hive_meeting_meeting_date, with: Date.current.advance(days: 5)
    fill_in :hive_meeting_meeting_time, with: "6:30 PM".to_time
    attach_file :hive_meeting_agenda, Rails.root.to_s + "/spec/example.pdf"
    click_button "btn-save"
    expect(page).to have_content("La réunion a été ajoutée")
    expect(page).to have_css("table#upcoming-meetings tbody tr", count: 2)
    expect(page).to have_css("table#upcoming-meetings tbody tr", text: "Chez nous")
    expect(page).to have_css("table#upcoming-meetings tbody tr:nth-child(2) a", text: "Télécharger")    
  end

   scenario "Edit a meeting" do
     connect(users(:the_admin))
     visit "/admin/hives"
     click_link "Réunions"
   
     x = find("table#upcoming-meetings tbody tr:nth-child(1)")
     within x do 
       click_link "Modifier"
     end

     fill_in :hive_meeting_location, with: "Chez vous"
     click_button "btn-save"
     expect(page).to have_css("table#upcoming-meetings tbody tr", count: 1)
     expect(page).to have_css("table#upcoming-meetings tbody tr", text: "Chez vous")
   end

   scenario "Delete a meeting" do
     meeting_location = hive_meetings(:upcoming_meeting_in_vlq).location
     connect(users(:the_admin))
     visit "/admin/hives"
     click_link "Réunions"
     expect(page).to have_css("table#upcoming-meetings tbody tr", text: meeting_location)    
     x = find("table#upcoming-meetings tbody tr:nth-child(1)")
     within x do 
       click_link "Supprimer"
     end    
     expect(page).to have_content("La réunion a été supprimée")
     expect(page).not_to have_css("table#upcoming-meetings tbody tr", text: meeting_location)
   end
  
   scenario "entering invalid fields should not save the meeting" do
     connect(users(:the_admin))
     visit "/admin/hives"
     click_link "Réunions"
     click_link "add-meeting"

     fill_in :hive_meeting_location, with: ""
     fill_in :hive_meeting_address, with: ""
     fill_in :hive_meeting_meeting_date, with: ""
     fill_in :hive_meeting_meeting_time, with: ""     
     click_button "btn-save"
     expect(page).to have_css(".has-error", count: 4)
   end  
end
