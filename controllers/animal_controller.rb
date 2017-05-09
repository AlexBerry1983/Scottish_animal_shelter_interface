require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('../models/animal.rb')
require_relative('../models/owner.rb')


get '/animals' do
  @animals = Animal.find_all
  erb(:"animals/index")
end

get '/animals/new' do
  erb(:"animals/new")
end

get '/animals/:id/edit' do
  @animal = Animal.find( params[:id] )
  @owners = Owner.find_all
  erb(:"animals/edit")
end

post '/animals/:id' do
  # puts params
  Animal.new( params ).update
  redirect to '/animals'
end