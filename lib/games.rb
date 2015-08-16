def list_games(data)
  message(data) do
    arg = get_args(data, 2, false)
    sort = arg.present? ? arg.to_sym : :name
    format_table(Game.order(sort))
  end
end

def get_random_game(data)
  message(data) do
    format(Game.find(Game.count))
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
  data << ['Description', game[:description]]
  data << ['Link', game[:link]]


  data.map{ |info| info.join(': ')}.join("\n")
end