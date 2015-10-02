require 'rails_helper'

feature "ManagingHives", :type => :feature do
  fixtures :users, :hives
  
  scenario "Editing an ACRQ" do
    connect(users(:the_admin))
    visit admin_root_path    
    click_link "manage-hives"    
    edit_first_hive

    fill_in :hive_number, with: 10000
    fill_in :hive_name, with: "Ceci est un nouveau nom"
    click_button "btn-save"
    expect(page).to have_content("Les changements ont été enregistrés")
    expect(page).to have_css(".btn-group:nth-child(1)", text: "Ceci est un nouveau nom")    
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

  private
  def edit_first_hive
    x = find(".btn-group:nth-child(1)")
    within x do 
      click_link "Informations" 
    end    
  end
end
