class AddFieldsToEventParticipants < ActiveRecord::Migration
  def change
    add_column :participants, :postal_code, :string, limit: 10
    add_column :participants, :city, :string, limit: 200
  end
end
