Bundler.require
require_relative 'models/parser'
require_relative 'models/stations'

DataMapper.setup(:default, "sqlite3://#{Dir.pwd}/restful_bikes_development.db")
DataMapper.auto_migrate!
module Bikes
  class App < Sinatra::Base

    # Now, following the example laid out in the reading create
    # a complete set of routes for the station resource.
    # /stations/, /stations/1, /stations/new, /stations/edit/1, /stations/delete/1

    get '/' do
      "hello world"
    end

    get '/stations' do
      # list stations
    end

    post '/stations' do
      # create new station
    end

    get '/stations/new' do
      # create new station
    end


  end
end