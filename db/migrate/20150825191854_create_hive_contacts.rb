class CreateHiveContacts < ActiveRecord::Migration
  def change
    create_table :hive_contacts do |t|
      t.integer :hive_id
      t.string :full_name
      t.string :phone
      t.string :email      
      t.string :function
    end
    add_index :hive_contacts, :hive_id
  end
end