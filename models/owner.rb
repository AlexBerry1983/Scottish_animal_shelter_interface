class Owner

  attr_reader :id, :name, :address

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

end