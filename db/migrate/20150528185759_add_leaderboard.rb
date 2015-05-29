class AddLeaderboard < ActiveRecord::Migration

  def change

      create_table :leaderboards do |t|
        t.string :name
        t.integer :win_count, default: 0
        t.integer :loss_count, default: 0
      end

  end
end
