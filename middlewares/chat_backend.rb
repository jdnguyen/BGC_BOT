require 'terminal-table'
require 'slack-ruby-client'
Dir["./models/*.rb"].each {|file| require file }
Dir["./lib/*.rb"].each {|file| require file }


module BgcBot
  class ChatBackend

    def initialize(app)
      client.on :message do |data|
        case data['text']
          when /^promote/ then
            promote_user(data)
          when /^demote/ then
            demote_user(data)
          when /^game won/ then
            win_game(data)
          when 'my stat' then
            my_stat(data)
          when 'vote start' then
            start_game_vote(data)
          when /^vote result/ then
            get_vote_result(data)
          when /^vote/ then
            vote_game(data)
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
          when /^game list/ then
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

  end
end
