require('pry-byebug')
 require_relative('../models/owner')
 require_relative('../models/pets')

 Owner.delete_all()
 

 owner1 = Owner.new({
   'name' => 'Angus',
   'address' => '23 made up street'
 })

 owner1.save

 