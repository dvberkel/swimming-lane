require 'screen'
require 'transition'

class Lane
  attr_reader :name, :screen, :transition
  def initialize(name, screen = NullScreen.new)
    @name = name
    @screen = screen
    @transition = NullTransition.new
  end

  def transitionTo(lane)
    @transition = Transition.new(self, lane)
  end

  def renderOn(brush)
    brush.render :lane, @screen, @transition
  end

  def ==(lane)
    self.eql?(lane)
  end

  def eql?(lane)
    self.name == lane.name
  end    

  def hash
    @name.hash
  end
end

class NullLane < Lane
  def initialize
    super("")
  end
end
