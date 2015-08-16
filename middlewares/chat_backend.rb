require 'data_mapper'
require 'slack'

DataMapper.setup(:default, 'sqlite::memory:')

class Game
  include DataMapper::Resource

  property :id,    Serial
  property :title, String
end

module BgcBot
  class ChatBackend

    def initialize(app)
      client.on :message do |data|
        case data['text']
          when 'roll dice' then
            roll_dice(data)
          when 'flip coin' then
            flip_coin(data)
          when 'games list' then
            list_games(data)
        end
      end

      client.start!
    end

    private

      def list_games(data)
        list = Game.all.map do |game|
          game.attributes
        end

        message(data, list.to_json)
      end

      def flip_coin(data)
        message(data, rand(1) == 0 ? 'heads' : 'tail')
      end

      def roll_dice(data)
        message(data, (rand(6) + 1).to_s)
      end

      def message(data, message)
        client.message(:channel => data['channel'], :text => message)
      end

      def client
        @client ||= begin
          Slack::RealTime::Client.new
        end
      end

  end
end
