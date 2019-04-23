require 'bundler/setup'
Bundler.require
require 'sinatra/reloader' if development?
require './models/count.rb'

before do
  if Count.all.size == 0
    Count.create(number: 0, title: "default")
  end
end

get '/' do
  @count = Count.all
  erb :index
end

post '/plus/:id' do
  count = Count.find_by(id: params[:id])
  count.number = count.number + 1
  count.save
  redirect '/'
end

post '/minus/:id' do
  count = Count.find_by(id: params[:id])
  count.number = count.number - 1
  count.save
  redirect '/'
end

post '/clear/:id' do
  count = Count.find_by(id: params[:id])
  count.number = 0
  count.save
  redirect '/'
end

post '/add' do
  Count.create(number: 0, title: params[:title])
  redirect '/'
end

post '/delete/:id' do
  Count.find_by(id: params[:id]).destroy
  redirect '/'
end