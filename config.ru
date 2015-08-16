require './app'
require './middlewares/chat_backend'
require 'slack'

use BgcBot::ChatBackend
run BgcBot::App

Slack.configure do |config|
  config.token = 'xoxb-9036022902-7L90vT4CO10MOkh1zVQV5Zey'
  #config.token = ENV['SLACK_API_TOKEN']
end