require './app'
require './middlewares/chat_backend'
require 'slack-ruby-client'

Slack.configure do |config|
  config.token = ENV['SLACK_API_TOKEN']
end

use BgcBot::ChatBackend
run BgcBot::App