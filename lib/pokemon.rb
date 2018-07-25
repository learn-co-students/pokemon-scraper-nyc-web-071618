class Pokemon
  attr_reader :id, :name, :type, :db
  def initialize(id:,name:, type:, db:)
    @id = id
    @name = name
    @type = type
    #db.execute("insert into pokemon(id, name, type) values(?,?,?)", id, name, type)
  end
  
  
  def self.save(name, type, db)
    db.execute("insert into pokemon(name, type) values(?,?)",name, type)
  end
  
  def self.find(id, db)
    #db.results_as_hash = true
    res = db.execute("select * from pokemon where id =?", id)[0]
    self.new({id: res[0], name: res[1], type: res[2], db: db})
  end
end
