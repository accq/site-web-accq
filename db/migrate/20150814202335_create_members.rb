class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :postal_code
      t.string :city
      t.timestamps null: false
      t.datetime :confirmed_at
    end
  end
end