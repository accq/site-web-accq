class CreateEngagements < ActiveRecord::Migration
  def change
    create_table :engagements do |t|
      t.string :notes
      t.integer :candidate_id
      t.integer :status # {0: Refuse, 1: Accept, 2: Don't want to pronounce, 3: No reply}
      t.timestamps null: false
    end
  end
end
