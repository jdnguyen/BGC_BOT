require './app'
require './middlewares/chat_backend'
require 'slack-ruby-client'

Slack.configure do |config|
  config.token = ''
end

use BgcBot::ChatBackend
run BgcBot::App
