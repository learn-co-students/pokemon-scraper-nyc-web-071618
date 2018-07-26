class Pokemon
  attr_reader :id, :name, :type, :db, :hp
  attr_writer :hp
  def initialize(id: ,name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @hp = 60
    #db.execute("insert into pokemon(id, name, type) values(?,?,?)", id, name, type)
  end
  
  
  def self.save(name, type, db)
    
    db.execute("insert into pokemon(name, type) values(?,?)",name, type)
  end
  
  def self.find(id, db)
    #db.results_as_hash = true
    res = db.execute("select * from pokemon where id =?", id)[0]
    obj = self.new({id: res[0], name: res[1], type: res[2], db: db})
    obj.hp = res[3]
    obj
  end
  
  def alter_hp(hp, db)
    @hp = hp
    db.execute("update pokemon set hp=? where id=?", hp, self.id)
  end
end
