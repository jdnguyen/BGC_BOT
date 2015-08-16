def my_stat(data)
  message(data) do

    user = get_user(data)
    user_votes = user.user_votes.group(:game_id).count

    vote_rows = user_votes.map do |user_vote|
      [Game.find(user_vote[0]).name, user_vote[1]]
    end

    wins = user.wins.group(:game_id).count
    win_rows = wins.map do |win|
      [Game.find(win[0]).name, win[1]]
    end

    "<@#{user.user_id}>
User ID: #{user.user_id}

Has Voted For ```#{Terminal::Table.new :headings => ['Game', 'Votes'], :rows => vote_rows}```

Has Won ```#{Terminal::Table.new :headings => ['Game', 'Wins'], :rows => win_rows}```
"
  end
end

def win_game(data)
  message(data) do
    raise 'User does not have permission to record wins' unless get_user(data).admin?

    game = game_for_id(data, 2)
    user_id = get_args(data, 3)[/.*<@([^>]*)/,1]

    win = Win.new
    win.game = game
    win.user = User.find_or_create_by!(:user_id => user_id)
    win.save!

    "Congrats <@#{user_id}> on winning tonight! Your win has been saved."
  end
end

def promote_user(data)
  message(data) do
    raise 'no u' unless data['user'] == 'U029V9XKP'
    user_id = get_args(data, 1)[/.*<@([^>]*)/,1]
    user = User.find_or_create_by!(:user_id => user_id)

    user.admin = true
    user.save!
  end
end

def demote_user(data)
  message(data) do
    raise 'no u' unless data['user'] == 'U029V9XKP'

    user_id = get_args(data, 1)[/.*<@([^>]*)/,1]
    user = User.find_or_create_by!(:user_id => user_id)

    user.admin = false
    user.save!
  end
end