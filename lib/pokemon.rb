class Pokemon 
  
  attr_accessor :id, :name,:type,:db
  
  
    def initialize(id:nil, name:,type:,db:)
      @id = id
      @name = name
      @type = type
      @db = db
    end
    
    
    def self.save(name, type, db)
      db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name, type)
    end 
    
      def self.find(id,db)
      db.execute("SELECT * FROM pokemon WHERE id = ?")
      end
     
      def self.find(name)
        sql = "SELECT * FROM pokemon WHERE name = ?"
        result = DB[:conn].execute(sql, name)[0]
        Pokemon.new(result[0], result[1], result[2])
      end
     
      def self.create(name:, type:,db:)
        pokemon = Pokemon.new(name,type,db)
        pokemon.save
        pokemon
      end
  end  
