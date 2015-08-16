require 'sinatra/base'

module BgcBot
  class App < Sinatra::Base

    get '/' do
      'why u here'
    end

  end
end