class Lane
  def initialize(name)
    @name = name
  end

  def name
    @name
  end

  def eql?(lane)
    self.name == lane.name
  end    

  def hash
    @name.hash
  end
end
