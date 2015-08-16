class AddUserVote < ActiveRecord::Migration
  def change
    create_table :user_votes do |t|
      t.timestamps :null => false
    end

    add_reference :user_votes, :game, :index => true, :null => false
    add_reference :user_votes, :user, :index => true, :null => false
    add_reference :user_votes, :vote, :index => true, :null => false

  end
end
