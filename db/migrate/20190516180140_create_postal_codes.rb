class CreatePostalCodes < ActiveRecord::Migration
  def change
    create_table :postal_codes do |t|
      t.string :postal_code, null: false
      t.string :city
      t.integer :no_administrative_region
      t.string :administrative_region
      t.timestamps null: false
    end
    add_index :postal_codes, :postal_code, unique: true
  end
end
