require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('../models/animal.rb')

get '/animals' do
  @animals = Animal.find_all
  erb(:"animals/index")
end

get '/animals/new' do
  erb(:"animals/new")
end

get '/animals/:id/edit' do
  @animal = Animal.find( params[:id] )
  erb(:"animals/edit")
end

# post '/animals/:id' do
#   Animal.new( params ).update
#   redirect to '/animals'
# end