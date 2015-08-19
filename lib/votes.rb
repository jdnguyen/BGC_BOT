require 'net/http'

def start_game_vote(data)
  message(data) do
    params = {
      "title" => "BGC #{Time.now.strftime("%m/%d/%Y")}",
      "options" => Game.order(:name).map(&:name),
      "permissive" => true,
      "multi" => true
    }

    uri = URI('http://strawpoll.me/api/v2/polls')
    response = Net::HTTP.post_form(uri, params)

    "Hello! We will now be starting a vote to decide what game we will play. You can vote for as many games as you want! Please vote here: https://strawpoll.me/#{JSON.parse(response.body)['id']}"
  end
end
