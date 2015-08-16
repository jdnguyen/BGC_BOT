class Vote < ActiveRecord::Base

  has_many :user_votes

end