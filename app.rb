Bundler.require
require_relative 'models/parser'
require_relative 'models/stations'

DataMapper.setup(:default, "sqlite3://#{Dir.pwd}/restful_bikes_development.db")
DataMapper.auto_migrate!
module Bikes
  class App < Sinatra::Base

    get '/' do
      redirect "/stations"
    end

    # list all stations
    get '/stations' do
      @stations = Station.all
      erb :index
    end

    # add new station
    get '/stations/new' do
      @station = Station.new
      erb :new
    end

    #show a single station
    get '/stations/:id' do
      @station = Station.get(params[:id])
      erb :show
    end

    # create new station  
    post '/stations' do
      @station = Station.new(params[:station])
      if @station.save
        status 201
        redirect '/stations/' + @station.id.to_s
      else
        status 400
        erb :new
      end
    end

    # edit station
    get '/stations/edit/:id' do
      @station = Station.get(params[:id])
      erb :edit
    end

    # update station
    put '/stations/:id' do
      @station = Station.get(params[:id])
      if @station.update(params[:station])
        status 201
        redirect '/stations/' + params[:id]
      else
        status 400
        erb :edit  
      end
    end

    # delete station confirmation
    get '/stations/delete/:id' do
      @station = Station.get(params[:id])
      erb :delete
    end

    # delete station
    delete '/stations/:id' do
      Station.get(params[:id]).destroy
      redirect '/stations'  
    end


  end
end