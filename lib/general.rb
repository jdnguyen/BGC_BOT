def help_message(data)
  message(data) do
    rows = [
        ["ping", "pong"],
        ["game time", "It's time to d-d-d-d-dual! (this pings channel)"],
        ["roll dice [N]", "1-6. [N] is optional for upper limit for dice"],
        ["flip coin", "heads/tails"],
        ["game list", "list all games and prints small details"],
        ["game random", "display a random game"],
        ["game get [N]", "[N] is ID or name of the game to display"],
        ["game players [N]", "[N] is the number of players playing"],
        ["game duration [N]", "[N] is the minutes for game duration"],
        ["vote start", "start a game vote"],
        ["vote [N]", "[N] is the id or name of a game"],
        ["vote result", "the current vote result"],
        ["promote [U]", "[U] is user to be promoted to admin"],
        ["demote [U]", "[U] is user to be demoted"],
        ["game won [N] [U]", "Save winner for game. [N] is game id or name and [U] is for the user"],
        ["my stat", "print your votes and game wins"]
    ]

    "HELP ```#{Terminal::Table.new :headings => ['Command', 'Description'], :rows => rows}```"
  end
end

def game_time(data)
  message(data) do
    "Hello <!channel>! We will be playing today at 6:30PM. Please respond or use the emojis if you are planning on attending tonight! If you have a preference on what game you would like to play tonight, please state it in the channel."
  end
end

def flip_coin(data)
  message(data) do
    rand(1) == 0 ? 'heads' : 'tail'
  end
end

def roll_dice(data)
  message(data) do
    msg_array = data['text'].split(' ')
    number = msg_array.length > 2 ? msg_array[2].to_i : 6

    (rand(number) + 1).to_s
  end
end
