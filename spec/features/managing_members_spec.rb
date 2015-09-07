require 'rails_helper'

feature "ManagingMembers", :type => :feature do
  fixtures :all
  
  scenario "Unconfirmed signatures can be approved on the index page" do
    connect(users(:the_admin))
    visit "/admin/members"
    expect(page).to have_css("table#unconfirmed-members tbody tr", count: 1)

    x = find("table#unconfirmed-members tbody tr:nth-child(1)")
    within x do
      click_link "Approuver" 
    end     
    expect(page).to have_content("La signature a été approuvée et apparaît maintenant sur le site.")
    expect(page).to have_css("table#unconfirmed-members", count: 0)
    expect(page).to have_css("table#confirmed-members tbody tr", count: 4)
  end

  scenario "Unconfirmed signatures can be deleted" do
    connect(users(:the_admin))
    visit "/admin/members"

    x = find("table#unconfirmed-members tbody tr:nth-child(1)")
    within x do
      click_link "Supprimer" 
    end     
    expect(page).to have_content("La signature a été supprimée de la base de données.")

    expect(page).to have_css("table#confirmed-members tbody tr", count: 3)
    expect(page).to have_css("table#unconfirmed-members", count: 0)
  end


  scenario "Confirmed signatures can be set as unconfirmed again" do
    connect(users(:the_admin))
    visit "/admin/members"
    expect(page).to have_css("table#confirmed-members tbody tr", count: 3)

    x = find("table#confirmed-members tbody tr", text: "Solange")
    within x do
      click_link "Désapprouver" 
    end     
    expect(page).to have_content("La signature a été désapprouvée et n'apparaît plus sur le site.")
    expect(page).to have_css("table#unconfirmed-members tbody tr", count: 2)
    expect(page).to have_css("table#confirmed-members tbody tr", count: 2)
    expect(page).to have_css("table#unconfirmed-members tr", text: "Solange")
    expect(page).not_to have_css("table#confirmed-members tr", text: "Solange")

  end
end
