require('pg')
class SqlRunner

  def SqlRunner.run( sql )
    begin
      db = PG.connect({ dbname: 'animal_shelter', host: 'localhost' })
      result = db.exec(sql)
    ensure
      db.close
    end
    return result
  end

end
