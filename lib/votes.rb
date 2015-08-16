def start_game_vote(data)
  message(data) do
    vote = Vote.create!

    "Voting period (##{vote.id}) has now begun. Please do \"vote game_id_or_name_here\" to cast your vote on the next game to play. Type \"vote result\" to see the votes."
  end
end

def get_vote_result(data)
  message(data) do
    vote_id = get_args(data, 2, false)
    vote = vote_id.present? ? Vote.find(vote_id) : Vote.last
    user_votes = vote.user_votes.group(:game_id).count

    rows = user_votes.map do |user_vote|
      [Game.find(user_vote[0]).name, user_vote[1]]
    end

    "Vote Result ##{vote.id} ```#{Terminal::Table.new :headings => ['Game', 'Votes'], :rows => rows}```"
  end
end

def vote_game(data)
  vote = Vote.last
  game = game_for_id(data, 1)
  user = get_user(data)

  user_vote = vote.user_votes.where(:user_id => user.id).first

  unless user_vote
    user_vote = UserVote.new
    user_vote.user = user
    user_vote.vote = vote
  end

  user_vote.game = game
  user_vote.save!
end