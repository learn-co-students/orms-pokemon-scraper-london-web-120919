class Pokemon
    attr_accessor :id, :name, :type, :db

    def initialize(id:,name:,type:,db:)
        @id = id
        @name = name
        @type = type
        @db = db
    end

    def self.save(name_n,type_n,db_c)
        sql = <<-SQL
            INSERT INTO pokemon (name,type)
            VALUES(?,?)
        SQL
        db_c.execute(sql,name_n,type_n) ##### I don't know what to do in this part here
    end

    def self.find(id,db_c)
    #     sql = "SELECT * FROM songs WHERE name = ?"
    # result = DB[:conn].execute(sql, name)[0]
    # Song.new(result[0], result[1], result[2])
        sql = <<-SQL
            SELECT *
            FROM pokemon
            WHERE id = ?
        SQL
        pk = db_c.execute(sql,id)[0]
        Pokemon.new(id:pk[0],name:pk[1],type:pk[2],db:db_c)
    end
end
