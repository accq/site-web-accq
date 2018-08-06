class CreateDistricts < ActiveRecord::Migration
  def change
    create_table :districts do |t|
      t.string :name
      t.integer :hive_id
      t.timestamps null: false
    end

    add_index :districts, :hive_id #hive is an old and obsolete ACCQ term that corresponds to "region administrative"
  end
end
