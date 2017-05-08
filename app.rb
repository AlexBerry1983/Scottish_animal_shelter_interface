require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('models/animal.rb')
require_relative('models/owner.rb')

get '/animals' do
  @animals = Animals.find_all
  erb(:index)
end