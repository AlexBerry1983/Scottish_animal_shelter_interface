require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('../models/owner.rb')
require_relative('../models/animal.rb')

get '/owners' do
  @owners = Owner.find_all
  erb(:"owners/index")
end

get '/owners/new' do
  erb(:"owners/new")
end

get '/owners/:id/edit' do
  @owner = Owner.find(params[:id])
  erb(:"owners/edit")
end

post '/owners' do
  @owner = Owner.new(params)
  @owner.save
  redirect to '/owners'
end

post '/owners/:id' do
  @owner = Owner.new(params).update
  redirect('/owners')
end 

post '/owners/:id/delete' do
  @owner = Owner.find(params[:id])
  @owner.delete
  redirect to '/owners'
end