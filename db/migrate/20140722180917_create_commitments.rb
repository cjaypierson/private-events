class CreateCommitments < ActiveRecord::Migration
  def change
    create_table :commitments do |t|
      t.integer :event_attendee_id
      t.integer :attended_event_id

      t.timestamps
    end
  end
end
