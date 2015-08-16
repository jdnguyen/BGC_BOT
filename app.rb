require 'sinatra'
require 'sinatra/activerecord'
require './config/environments'

module BgcBot
  class App < Sinatra::Base

    get '/' do
      'why u here'
    end

  end
end