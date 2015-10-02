class CreateHiveMeetings < ActiveRecord::Migration
  def change
    create_table :hive_meetings do |t|
      t.integer :hive_id
      t.string :location #restaurant XYZ, salle communautaire, etc...      
      t.string :map_url #Google map url
      t.string :city 
      t.string :address
      t.date :meeting_date
      t.time :meeting_time
      t.string :agenda #ordre du jour (fichier)
      t.string :report #compte rendu (fichier)
    end
    add_index :hive_meetings, :hive_id
  end
end
