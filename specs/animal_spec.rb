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
    assert_equal('Cat', animal1.type)
    assert_equal('March 21 2016', animal1.admission_date)
    assert_equal(true, animal1.adoptable)
  end


end