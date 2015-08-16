class AddGame < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :name
      t.integer :min_player
      t.integer :max_player
      t.string :link
      t.integer :min_time
      t.integer :max_time
      t.integer :time_played, :default => 0
      t.integer :ranking
      t.text :description

      t.timestamps :null => false
    end
  end
end
