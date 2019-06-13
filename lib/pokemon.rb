class Pokemon
    attr_accessor :name, :type, :id, :hp
    attr_reader :db
    

    def initialize(id: nil, name:, type:, hp: nil, db:)
        @id = id
        @name = name
        @type = type
        @hp = hp
        @db = db
    end

    def self.save(name, type, db)
            sql = "INSERT INTO pokemon (name, type) VALUES (?, ?)"
            db.execute(sql, name, type)
            @id = db.execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
    end

    def self.find(num, db)
        sql = "SELECT * FROM pokemon WHERE id = ?"
        pokemon_info = db.execute(sql, num).flatten
        Pokemon.new(id: pokemon_info[0], name: pokemon_info[1], type: pokemon_info[2], hp: pokemon_info[3], db: db)
    end

    def alter_hp(new_hp, db)
        db.execute("UPDATE pokemon SET hp = ? WHERE id = ?;", new_hp, self.id)
    end

end

