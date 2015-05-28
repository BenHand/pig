class Leaderboard < ActiveRecord::Migration

  def change
    create_table :Leaderboards do |t|
      t.string :name
      t.integer :score
      t.integer :win_count
      t.integer :loss_count
    end

  end

end
