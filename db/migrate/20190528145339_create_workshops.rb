class CreateWorkshops < ActiveRecord::Migration
  def change
    create_table :workshops do |t|
      t.string :name
      t.datetime :starts_at
      t.datetime :ends_at
      t.string :description
      t.string :animation
      t.string :expertise
      t.integer :available_slots, default: 25
      t.timestamps null: false
    end
  end
end
