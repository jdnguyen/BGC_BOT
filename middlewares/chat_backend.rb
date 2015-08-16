require 'terminal-table'
require 'slack'
require './lib/games'

module BgcBot
  class ChatBackend

    def initialize(app)
      client.on :message do |data|
        case data['text']
          when 'ping' then
            message(data) do
              'pong'
            end
          when 'help' then
            help_message(data)
          when 'game time' then
            game_time(data)
          when /^roll dice/
            roll_dice(data)
          when 'flip coin' then
            flip_coin(data)
          when 'game list' then
            list_games(data)
          when 'game random' then
            get_random_game(data)
          when /^game get/
            get_game(data)
          when /^game players/
            get_games_for_players(data)
          when /^game duration/
            get_games_for_duration(data)
        end
      end

      client.start!
    end

    private

      def help_message(data)
        message(data) do
          "game time - It's time to d-d-d-d-dual!
ping - pong
roll dice N - 1-6. N is optional for upper limit for dice
flip coin - heads/tails
game list - list all games and prints small details
game random - display a random game
game get N - N is ID of the game to display
game players N - N is the number of players playing
game duration N - N is the minutes for game duration
"
        end
      end

      def game_time(data)
        message(data) do
          "Hello <!channel>! We will be playing today at 6:30PM. Please respond or use the emojis if you are planning on attending tonight! If you have a preference on what game you would like to play tonight, please state it in the channel."
        end
      end

      def list_games(data)
        message(data) do
          format_table(GAMES)
        end
      end

      def get_random_game(data)
        message(data) do
          format(GAMES[rand(GAMES.count)])
        end
      end

      def get_game(data)
        message(data) do
          msg_array = data['text'].split(' ')

          raise 'Need Game ID' unless msg_array[2]
          format(game_for_id(msg_array[2]))
        end
      end

      def get_games_for_players(data)
        message(data) do
          msg_array = data['text'].split(' ')

          raise 'Need number of players' unless msg_array[2]
          number = msg_array[2].to_i

          format_table(GAMES.select{ |game| game[:min_player] <= number && game[:max_player] >= number})
        end
      end

      def get_games_for_duration(data)
        message(data) do
          msg_array = data['text'].split(' ')

          raise 'Need duration' unless msg_array[2]
          number = msg_array[2].to_i
          format_table(GAMES.select{ |game| game[:min_time] <= number && ((game[:max_time] && game[:max_time] >= number) || game[:max_time].nil?) })
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

      def format_table(games)
        list = []

        games.each do |game|
          list << [game[:id], game[:name], game[:ranking], format_players(game), format_time(game)]
        end

        Terminal::Table.new :headings => ['ID', 'Title', 'Ranking', '# of Players', 'Duration'], :rows => list
      end

      def message(data, &block)
        return unless data['channel'] == 'C095AMPU3'

        message = ''

        begin
          message = block.call
        rescue Exception => e
          message = "Error: #{e.message}"
        end

        client.message(:channel => data['channel'], :text => message)
      end

      def game_for_id(id)
        GAMES.find do |game|
          if /\A\d+\z/.match(id)
            game[:id] == id.to_i
          else
            game[:name].downcase.include? id.downcase
          end
        end
      end

      def client
        @client ||= begin
          Slack::RealTime::Client.new
        end
      end

  end
end
