class AddPlay < ActiveRecord::Migration
  def change
    create_table :plays do |t|
      t.timestamps :null => false
    end

    add_reference :plays, :game, :index => true, :null => false

  end
end
