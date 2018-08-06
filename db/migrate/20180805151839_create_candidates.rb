class CreateCandidates < ActiveRecord::Migration
  def change
    create_table :candidates do |t|
      t.string :last_name
      t.string :first_name
      t.string :middle_name
      t.integer :district_id
      t.integer :political_party_id
      t.timestamps null: false
    end
    add_index :candidates, :district_id
    add_index :candidates, :political_party_id
  end
end
