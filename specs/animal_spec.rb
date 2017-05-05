require('Minitest/autorun')
require('minitest/rg')
require_relative('../models/animal')

class AnimalTest < Minitest::Test

  def test_can_create_animal
    animal1 = Animal.new({
      'name' => 'Scrappy',
      'type' => 'Cat',
      'admission_date' => 'March 21 2016',
      'adoptable' => true,
    })
    assert_equal('Scrappy', animal1.name)
  end


end