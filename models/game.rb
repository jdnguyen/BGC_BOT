class Game < ActiveRecord::Base

  has_many :plays
  has_many :user_votes
  has_many :wins

end