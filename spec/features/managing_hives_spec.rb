require 'rails_helper'

feature "ManagingHives", :type => :feature do
  fixtures :users, :hives
  
  scenario "Adding a new ACRQ" do
    connect(users(:the_admin))
    visit admin_root_path    
    click_link "manage-hives"
    click_link "add-hive"
    fill_in :hive_number, with: 2
    fill_in :hive_name, with: "My new ACRQ"
    click_button "btn-save"
    expect(page).to have_content("L'ACRQ a été ajoutée")
    expect(page).to have_css("table tbody tr td", text: "My new ACRQ")    
  end

  scenario "Editing an ACRQ" do
    connect(users(:the_admin))
    visit admin_root_path    
    click_link "manage-hives"
    
    edit_first_hive

    fill_in :hive_number, with: 10000
    fill_in :hive_name, with: "Ceci est un nouveau nom"
    click_button "btn-save"
    expect(page).to have_content("Les changements ont été enregistrés")
    expect(page).to have_css("table tbody tr td", text: "Ceci est un nouveau nom")    
  end

  scenario "Submitting an invalid form will show the user where the errors are" do
    connect(users(:the_admin))
    visit admin_root_path    
    click_link "manage-hives"
    edit_first_hive    
    fill_in :hive_number, with: 12.12
    fill_in :hive_name, with: ""
    click_button "btn-save"
    expect(page).to have_css(".has-error", count: 2)
  end

  scenario "Deleting an ACRQ" do
    connect(users(:the_admin))
    visit admin_root_path    
    click_link "manage-hives"
    x = find("table tbody tr", text: hives(:vive_le_quebec).name)
    within x do
      click_link "Supprimer" 
    end 

    expect(page).to have_content("L'ACRQ a été supprimée")
  end  

  private
  def edit_first_hive
    x = find("table tbody tr:nth-child(1)")
    within x do 
      click_link "Modifier" 
    end    
  end
end
