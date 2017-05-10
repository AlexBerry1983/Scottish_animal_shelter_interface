require_relative('./owner')
require_relative('../db/SqlRunner')

class Animal

  attr_reader :id
  attr_accessor :name, :type, :admission_date, :adoptable, :owner_id

  def initialize(params)
    @id = params['id'].to_i if params['id']
    @name = params['name']
    @type = params['type']
    @admission_date = params['admission_date']
    @adoptable = params['adoptable']
    @owner_id = params['owner_id'].to_i
  end

  def save
    sql = "INSERT INTO animals (name, type, admission_date, adoptable, owner_id) VALUES ('#{@name}', '#{@type}', '#{@admission_date}', '#{@adoptable}', #{@owner_id}) RETURNING id;"
    animal_hash = SqlRunner.run(sql).first
    @id = animal_hash['id'].to_i
  end

  def delete
    sql = "DELETE FROM animals where id = #{id}"
    SqlRunner.run(sql)
    return nil
  end

  def owner
    sql = "SELECT * FROM owners WHERE id = #{@owner_id}"
    owner_hash = SqlRunner.run(sql).first
    if owner_hash == nil
      return nil
    end
    return Owner.new(owner_hash)
  end

  def update
    sql = "UPDATE animals SET
    name = '#{@name}',
    type = '#{@type}',
    admission_date = '#{@admission_date}',
    adoptable = '#{@adoptable}',
    owner_id = #{@owner_id} 
    WHERE id = #{id}"
    SqlRunner.run(sql)
  end

  def Animal.find_by_type(looked_for_type)
    sql = "SELECT * FROM animals WHERE lower(type) LIKE lower('%#{looked_for_type}%')"
    animals_pg = SqlRunner.run(sql)
    animals_rb = animals_pg.map { |animal| Animal.new(animal) }
    return animals_rb
  end

  def Animal.all_rehab
    sql = "SELECT * FROM animals WHERE adoptable = #{false}"
    animals_pg = SqlRunner.run(sql)
    animals_rb = animals_pg.map { |animal| Animal.new(animal) }
    return animals_rb
  end

  def Animal.find(id)
    sql = "SELECT * FROM animals WHERE id = #{id}"
    animal = SqlRunner.run(sql).first
    return Animal.new(animal)
  end

  def Animal.delete_all
    sql = "DELETE FROM animals"
    SqlRunner.run(sql)
    return nil
  end
  
  def Animal.find_all
    sql = "SELECT * FROM animals" 
    animal_array_pg = SqlRunner.run(sql)
    animal_object_rb = animal_array_pg.map { |animal| Animal.new(animal) }
    return animal_object_rb
  end

  def Animal.all_adoptable
    sql = "SELECT * FROM animals WHERE adoptable = #{true}"
    animal_array_pg = SqlRunner.run(sql)
    animal_object_rb = animal_array_pg.map { |animal| Animal.new(animal) }
    return animal_object_rb
  end
end