class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :value, default: 0
      t.string :votable_type, null: false
      t.integer :votable_id, null: false
      t.integer :voter_id, null: false

      t.timestamps
    end
  end
end
