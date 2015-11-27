class CreateParticipants < ActiveRecord::Migration
  def change
    create_table :participants do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :email, null: false
      t.string :phone
      t.integer :event_id
      t.timestamps null: false
    end
    add_index :participants, :event_id
  end
end
