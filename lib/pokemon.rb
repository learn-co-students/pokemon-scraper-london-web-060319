class Pokemon
    # ---------------------- ATTEMPT 1 -------------------------
    attr_accessor :id, :name, :type, :db#, :hp

    def initialize(props = {})
        @id = props['id']
        @name = props['name']
        @type = props['type']
        @db = db
        # @hp = props['hp'] || 60
    end
    
    def self.save(name, type, db)
        
        sql = "INSERT INTO pokemon (name, type) VALUES (?, ?);)"
        db.execute(sql, name, type)
        @id = db.execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
        # if @id
        #     # sql = "UPDATE pokemon SET name = ?, type = ?"
        #     # db.execute(sql, name, type)
        #     sql = "UPDATE pokemon SET name = ?, type = ? WHERE id = ?"
        #     db.execute(sql, name, type, @id)
        # else
        #     sql =<<-SQL 
        #     INSERT INTO pokemon(name, type)
        #     VALUES(?, ?)
        #     SQL

        #     db.execute(sql, name, type)
        #     @id = db.execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
        # end
    end

    def self.new_from_db(row)
        new_pokemon = self.new
        new_pokemon.id = row[0]
        new_pokemon.name = row[1]
        new_pokemon.type = row[2]
        new_pokemon
    end
    

    def self.find(num, db)
        sql = "SELECT * FROM pokemon WHERE id = ?"
        new_thing = db.execute(sql, num).map{|row|self.new_from_db(row)}[0]

        # Pokemon.new(id: new_thing[0], name: new_thing[1], type: new_thing[2], db: db)
    end
end

#     ------------------------------ATTEMPT 2--------------------------


#     attr_accessor :id, :name, :type, :db

#     def initialize(props = {})
#         @id = props['id']
#         @name = props['name']
#         @type = props['type']
#         @db = props['db']
#     end

#     def self.save(name, type, db)
#         if self.id
#             self.update
#             # @id
#             # sql = "UPDATE students SET name = ?, type = ? WHERE id = ?"
#             # db.execute(sql, self.name, self.type, self.id)
#         else

#             sql = <<-SQL
#             INSERT INTO students(name, type)
#             VALUES(?, ?)
#             SQL

#             db.execute(sql, self.num, self.album)
#             db.execute("SELECT last_insert_rowid() FROM students")[0][0]
#         end
#     end

#     def update
#         sql = "UPDATE students SET name = ?, type = ? WHERE id = ?"
#         db.execute(sql, self.name, self.album, self.id)
#     end
#   end

#           ------------------ THE SOLUTION ----------------------

# attr_accessor :id, :name, :type, :db

# def initialize(props={})
#     @id = props['id']
#     @name = props['name']
#     @type = props['type']
#     @db = props['id']
# end

# def self.save(name, type, db)
#     db.execute("INSERT INTO pokemon(name, type) VALUES (?, ?)", name, type)
# end

# # def self.find(num, db)
# #     pokedex_entry = db.execute("SELECT * FROM pokemon WHERE id = ?, num)").flatten
# #     Pokemon.new(id: pokedex_entry[0], name: pokedex_entry[1], type: pokedex_entry[2], db: db)

# def self.find(id_num, db)
#     pokemon_info = db.execute("SELECT * FROM pokemon WHERE id=?", id_num).flatten
#     Pokemon.new(id: pokemon_info[0], name: pokemon_info[1], type: pokemon_info[2], db: db)
# end

# end

# ----------------  ACTUAL SOLUTION ------------------

# class Pokemon
#     attr_accessor :id, :name, :type, :hp, :db
  
#     def self.save(name, type, db)
#       db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
#     end
  
#     def self.find(id_num, db)
#       pokemon_info = db.execute("SELECT * FROM pokemon WHERE id=?", id_num).flatten
#       Pokemon.new(id: pokemon_info[0], name: pokemon_info[1], type: pokemon_info[2], hp: pokemon_info[3], db: db)
#     end
  
#     def initialize(id:, name:, type:, hp: nil, db:)
#       @id, @name, @type, @hp, @db = id, name, type, hp, db
#     end


# end

# ========================== BONUS ========================== 

