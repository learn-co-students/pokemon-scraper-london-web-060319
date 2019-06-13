class Pokemon

  attr_accessor :type, :db
  attr_reader :id, :name

  def initialize(id: nil, name:, type:, db: nil)
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
    sql = "SELECT * FROM pokemon WHERE id = ?"
    result = db.execute(sql, id)[0])
    Pokemon.new(id: result[0], name: result[1], type: result[2])
  end

end
