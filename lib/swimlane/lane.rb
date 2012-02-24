require 'screen'

class Lane
  attr_reader :name, :screen
  def initialize(name, screen = NullScreen.new)
    @name = name
    @screen = screen
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
