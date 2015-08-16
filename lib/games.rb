def list_games(data)
  message(data) do
    arg = get_args(data, 2, false)
    sort = arg.present? ? arg.to_sym : :name
    format_table(Game.order(sort))
  end
end

def get_random_game(data)
  message(data) do
    random = Game.find(rand(Game.count) + 1)
    format(random)
  end
end

def get_game(data)
  message(data) do
    format(game_for_id(data, 2))
  end
end

def get_games_for_players(data)
  message(data) do
    number = get_args(data, 2).to_i

    format_table(Game.select{ |game| game[:min_player] <= number && game[:max_player] >= number})
  end
end

def get_games_for_duration(data)
  message(data) do
    number = get_args(data, 2).to_i

    format_table(Game.select{ |game| game[:min_time] <= number && ((game[:max_time] && game[:max_time] >= number) || game[:max_time].nil?) })
  end
end

def play_game(data)
  message(data) do
    game = game_for_id(data, 2)

    play = Play.new
    play.game = game
    play.save!

    "Have fun playing #{game.name}!"
  end
end

def get_game_stat(data)
  message(data) do
    game = game_for_id(data, 2)

    played = game.plays.order('created_at DESC').first(5).map{ |play| play.created_at.strftime("%m/%d/%Y") }

    winnings = game.wins.group(:user_id).count
    win_rows = winnings.map do |win|
      ["#{User.find(win[0]).user_id}", win[1]]
    end

    "Number of times played: #{game.plays.count}

Number of times voted for: #{game.user_votes.count}

Last Played ``` #{played.join("\n")} ```

Previous Winners ```#{Terminal::Table.new :headings => ['User', 'Wins'], :rows => win_rows}```
"
  end
end

def format_table(games)
  list = []

  games.each do |game|
    list << [game[:id], game[:name], game[:ranking], format_players(game), format_time(game)]
  end

  "```#{Terminal::Table.new :headings => ['ID', 'Title', 'Ranking', '# of Players', 'Duration'], :rows => list}```"
end

def format_time(game)
  if game[:min_time] && game[:max_time]
    "#{game[:min_time]} - #{game[:max_time]} minutes"
  elsif game[:min_time]
    "#{game[:min_time]}+ minutes"
  end
end

def format_players(game)
  if game[:min_player] && game[:max_player]
    "#{game[:min_player]} - #{game[:max_player]} players"
  elsif game[:min_player]
    "#{game[:min_player]}+ players"
  end
end

def format(game)
  data = []

  data << ['ID', game[:id]]
  data << ['Title', game[:name]]
  data << ['Ranking', game[:ranking]]
  data << ['# of Players', format_players(game)]
  data << ['Duration', format_time(game)]
  data << ['Rules', game[:rules]]
  data << ['Link', game[:link]]

  "```#{Terminal::Table.new :rows => data}

#{game[:description]}```
"
end