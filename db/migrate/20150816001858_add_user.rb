class AddUser < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :user_id, :null => false
      t.boolean :admin, :default => false

      t.timestamps :null => false
    end
  end
end
