class User < ActiveRecord::Base

  has_many :user_votes
  has_many :wins

end