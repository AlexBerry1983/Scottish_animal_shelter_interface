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
  @owners = Owner.find_all
  erb(:"animals/new")
end

get '/animals/:id/edit' do
  @animal = Animal.find( params[:id] )
  @owners = Owner.find_all
  erb(:"animals/edit")
end

post '/animals' do
  @animal = Animal.new(params)
  @animal.save
  redirect to '/animals'
end

post '/animals/:id' do
  Animal.new( params ).update
  redirect to '/animals'
end

post '/animals/:id/delete' do
  @animal = Animal.find(params[:id])
  @animal.delete
  redirect to '/animals'
end