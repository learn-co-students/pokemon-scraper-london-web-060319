class Pokemon
    attr_accessor :name, :type, :db, :id
    
    def initialize(id:nil, name:, type:, db:nil, hp:nil)
        @id = id
        @name = name
        @type = type       
        @db = db
    end

    def self.save(name, type, db)
        sql = "insert into pokemon (name, type) values (?, ?)"
        db.execute(sql, name, type)
        @id = db.execute("select last_insert_rowid() from pokemon")[0][0]
    end

    def self.find(id, db)
        sql = "select * from pokemon where id = ?"
        p = db.execute(sql, id).flatten
        Pokemon.new(id: p[0], name: p[1], type: p[2], db: db)
    end

    def alter_hp(new_hp, db)
        sql = "UPDATE pokemon SET hp = ? WHERE id = ?"
        db.execute(sql, new_hp, self.id)
    end
end