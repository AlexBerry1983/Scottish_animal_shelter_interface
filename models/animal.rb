class Animal

  attr_reader :id, :name, :type

  def initialize(params)
    @id = params['id'].to_i if params['id']
    @name = params['name']
    @type = params['type']
  end

end