class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name
      t.string :league
      t.string :quarterback
      t.string :running_back_one
      t.string :wide_reciever_one
      t.string :running_back_two
      t.string :wide_reciever_two
      t.string :tight_end
      t.string :kicker
      t.string :defense
      t.integer :wins
      t.integer :losses
      t.integer :user_id
    end
  end
end
