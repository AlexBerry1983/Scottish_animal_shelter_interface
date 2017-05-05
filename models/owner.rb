class Owner

  attr_reader :id, :name, :address

  def initialize(params)
    @id = params['id'].to_i if params['id']
    @name = params['name']
    @address = params['address']
  end


end