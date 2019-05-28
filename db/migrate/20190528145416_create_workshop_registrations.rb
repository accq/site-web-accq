class CreateWorkshopRegistrations < ActiveRecord::Migration
  def change
    create_table :workshop_registrations do |t|
      t.integer :workshop_id
      t.string :email
      t.string :name
      t.string :phone
      t.timestamps null: false
    end
    add_index :workshop_registrations, :workshop_id
  end
end
