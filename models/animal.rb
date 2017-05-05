class Animal

  attr_reader :id, :name, :type, :admission_date

  def initialize(params)
    @id = params['id'].to_i if params['id']
    @name = params['name']
    @type = params['type']
    @admission_date = params['admission_date']
  end

end