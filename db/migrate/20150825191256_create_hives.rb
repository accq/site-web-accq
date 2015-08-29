class CreateHives < ActiveRecord::Migration
  def change
    create_table :hives do |t|
      t.string :name
      t.string :image
      t.integer :number
      t.string :fb_url    
    end
  end
end