require('pry-byebug')
require_relative('../models/owner')
require_relative('../models/animal')

 # Owner.delete_all()
 # Animal.delete_all()

 owner1 = Owner.new({
   'name' => 'Angus',
   'address' => '23 made up street'
 })

 owner2 = Owner.new({
   'name' => 'Paul',
   'address' => '42 imagination drive'
 })

 owner3 = Owner.new({
   'name' => 'Leon',
   'address' => '31 cant be serious close'
 })

  owner1.save
  owner2.save
  owner3.save 

 animal1 = Animal.new({
   'name' => 'Scrappy',
   'type' => 'Cat',
   'admission_date' => 'March 21 2016',
   'adoptable' => true,
   'owner_id' => owner1.id
 })

 animal2 = Animal.new({
   'name' => 'Albert',
   'type' => 'Chicken',
   'admission_date' => 'May 2 2017',
   'adoptable' => false,
   'owner_id' => owner2.id
   
 })

 animal3 = Animal.new({
   'name' => 'Ruffles',
   'type' => 'Dog',
   'admission_date' => 'March 21 2013',
   'adoptable' => true,
   'owner_id' => owner3.id
 })
 
 animal1.save
 animal2.save
 animal3.save

binding.pry
nil