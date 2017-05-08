class Owner

  attr_reader :id
  attr_accessor :name, :address

  def initialize(params)
    @id = params['id'].to_i if params['id']
    @name = params['name']
    @address = params['address']
  end

  def save
    sql = "INSERT INTO owners (name, address) VALUES ('#{@name}', '#{@address}') RETURNING id;"
    owner_hash = SqlRunner.run(sql).first
    @id = owner_hash['id'].to_i
  end

  def delete
    sql = "DELETE FROM owners where id = #{id}"
    SqlRunner.run(sql)
    return nil
  end

  def Owner.find(id)
    sql = "SELECT * FROM owners where id = #{id}"
    owner_rb = SqlRunner.run(sql).first
    return Owner.new(owner_rb)
  end

  def Owner.delete_all
    sql = "DELETE FROM owners"
    SqlRunner.run(sql)
    return nil
  end

  def Owner.find_all
    sql = "SELECT * FROM owners"
    owner_hash_pg = SqlRunner.run(sql)
    owner_array_rb = owner_hash_pg.map { |owner| Owner.new(owner) }
    return owner_array_rb
  end

end