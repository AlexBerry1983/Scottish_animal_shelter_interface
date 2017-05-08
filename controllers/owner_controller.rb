require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('../models/owner.rb')

get '/owners' do
  @owners = Owner.find_all
  erb(:"owners/index")
end

