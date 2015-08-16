class AddWin < ActiveRecord::Migration
  def change
    create_table :wins do |t|
      t.timestamps :null => false
    end

    add_reference :wins, :game, :index => true, :null => false
    add_reference :wins, :user, :index => true, :null => false

  end
end
