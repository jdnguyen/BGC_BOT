require './app'
require './middlewares/chat_backend'
require 'slack'

use BgcBot::ChatBackend
run BgcBot::App

Slack.configure do |config|
  config.token = ENV['SLACK_API_TOKEN']
end