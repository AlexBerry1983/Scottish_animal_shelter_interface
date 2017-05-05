require('pry-byebug')
 require_relative('../models/owner')
 require_relative('../models/pets')

 Owner.delete_all()
 Pet.delete_all()

 owner1 = Owner.new({
   'name' => 'Angus',
   'address' => '23 made up street'
 })

 owner2 = Owner.new({
   'name' => 'Paul',
   'address' => '42 imagination drive'
 })

 owner1 = Owner.new({
   'name' => 'Leon',
   'address' => '31 cant be serious close'
 })

  owner1.save
  owner2.save
  owner3.save 

 pet1 = Pet.new({
   'name' => 'Scrappy',
   'type' => 'Cat',
   'admission_date' => 'March 21 2013',
   'adoptable' => true,
   'owner_id' => owner1.id
 })


 pet1.save