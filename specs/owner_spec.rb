require('Minitest/autorun')
require('minitest/rg')
require_relative('../models/owner')

class OwnerTest < Minitest::Test

  def test_can_create_owner
    owner1 = Owner.new({
      'name' => 'Angus',
      'address' => '23 made up street'
      })
    assert_equal("Angus", owner1.name)
    assert_equal("23 made up street", owner1.address)
  end


end