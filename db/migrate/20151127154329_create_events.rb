class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name, null: false
      t.date :start_date, null: false
      t.date :end_date, null: false
      t.string :image
      t.text :body
      t.string :fb_url
      t.timestamps null: false
    end
  end
end
