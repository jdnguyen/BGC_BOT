def message(data, &block)
  return unless ['C03SX3GQ8', 'C095AMPU3'].include? data['channel']

  message = ''
  begin
    message = block.call
  rescue Exception => e
    message = "Error: #{e.message}"
  end

  client.message(:channel => data['channel'], :text => message)
end

def get_args(data, index, required = true)
  msg_array = data['text'].split(' ')

  raise 'Missing Value' if required && msg_array[index].blank?
  msg_array[index].blank? ? nil : msg_array[index]
end

def game_for_id(data, index)
  identifier = get_args(data, index).to_s

  Game.all.find do |game|
    if /\A\d+\z/.match(identifier)
      game[:id] == identifier.to_i
    else
      game[:name].downcase.include? identifier.downcase
    end
  end
end

def get_user(data)
  User.find_or_create_by!(:user_id => data['user'])
end

def client
  @client ||= Slack::RealTime::Client.new
end
