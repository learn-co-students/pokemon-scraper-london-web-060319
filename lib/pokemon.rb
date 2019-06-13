#@db = SQLite3::Database.new('../pokemon.db')

class Pokemon

    attr_accessor :name, :type, :db, :hp
    attr_reader :id

    def initialize(id: nil, name:, type:, db:, hp: nil)
        @id = id
        @name = name
        @type = type
        @db = db
        @hp = hp
    end

    def self.save(name, type, db)
        sql = "INSERT INTO pokemon (name, type) VALUES (?, ?)"
        db.execute(sql, name, type)
    end

    def self.find(id, db)
        sql = <<-SQL
            SELECT * FROM pokemon WHERE id = ?;
        SQL
        row = db.execute(sql, id).first

        pok = Pokemon.new(id: row[0], name: row[1], type: row[2], db: db, hp: row[3])

    end
    
    def alter_hp(new_hp, db)
        db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", new_hp, self.id)
    end
    


end
