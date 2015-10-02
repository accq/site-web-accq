class AddFbPageToHiveContacts < ActiveRecord::Migration
  def change
    add_column :hive_contacts, :fb_page, :string
  end
end
