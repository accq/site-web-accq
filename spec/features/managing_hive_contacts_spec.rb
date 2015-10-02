require 'rails_helper'

feature "ManagingHiveContacts", :type => :feature do
  fixtures :all

  scenario "Add a new contact" do
    connect(users(:the_admin))
    visit "/admin/hives"
    click_link "Responsables"
    click_link "add-contact"

    fill_in :hive_contact_full_name, with: "Marcel Gingras"
    fill_in :hive_contact_email, with: "marcel@marcel.com"
    fill_in :hive_contact_phone, with: "555-123-1234"
    click_button "btn-save"
    expect(page).to have_content("Le responsable a été ajouté")
    expect(page).to have_css("table tbody tr", text: "Marcel Gingras")
  end

  scenario "Edit a contact" do
    connect(users(:the_admin))
    visit "/admin/hives"
    click_link "Responsables"
   
    x = find("table tbody tr:nth-child(1)")
    within x do 
      click_link "Modifier"
    end

    fill_in :hive_contact_full_name, with: "Paul Lavergne"
    click_button "btn-save"
    expect(page).to have_content("Les informations du responsable ont été modifiées")
    expect(page).to have_css("table tbody tr", text: "Paul Lavergne")    
  end

  scenario "Delete a contact" do
    contact_name = hive_contacts(:georges_in_vlq).full_name
    connect(users(:the_admin))
    visit "/admin/hives"
    click_link "Responsables"
    expect(page).to have_css("table tbody tr", text: contact_name)    
    x = find("table tbody tr:nth-child(1)")
    within x do 
      click_link "Supprimer"
    end    
    expect(page).to have_content("Le responsable a été supprimé")
    expect(page).not_to have_css("table tbody tr", text: contact_name)  
  end
  
  scenario "entering invalid fields should not save the form" do
    connect(users(:the_admin))
    visit "/admin/hives"
    click_link "Responsables"
    click_link "add-contact"

    fill_in :hive_contact_full_name, with: ""
    fill_in :hive_contact_email, with: "notavalidemail"    
    click_button "btn-save"
    expect(page).to have_css(".has-error", count: 2)
  end
end
