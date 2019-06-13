class Pokemon
     attr_accessor(:id, :name, :type, :db, :hp)

    def initialize(id: nil, name:, type:, db: nil)
        @id = id
        @name = name
        @type = type
        @db = db
    end

    def self.save(name, type, db)
        sql = <<-SQL
            INSERT INTO pokemon (name, type)
            VALUES (?, ?)
        SQL
        db.execute(sql, name, type)
        @id = db.execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
    end

    def self.new_from_db(row)
        pokemon = self.new(id: row[0], name: row[1], type: row[2])
    end

    def self.find(id, db)
        sql = <<-SQL
            SELECT * FROM pokemon WHERE id = ?
        SQL
        db.execute(sql, id).map {|pika| new_from_db(pika)}.first
    end


    def alter_hp(hp, db)
        sql = "UPDATE pokemon SET hp = ? WHERE id = ?"
        db.execute(sql, hp, self.id)
    end
end
