class Animal

  attr_reader :id, :name

  def initialize(params)
    @id = params['id'].to_i if params['id']
    @name = params['name']
  end

end