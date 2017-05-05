class Animal

  attr_reader :id, :name, :type, :admission_date, :adoptable

  def initialize(params)
    @id = params['id'].to_i if params['id']
    @name = params['name']
    @type = params['type']
    @admission_date = params['admission_date']
    @adoptable = params['adoptable']
  end

end