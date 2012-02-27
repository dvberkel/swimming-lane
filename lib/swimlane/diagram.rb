require 'set'

class Diagram
  attr_reader :start
  def initialize(start = NullLane.new)
    @moments = []
    @start = start
  end

  def add(moment)
    @moments << moment
  end

  def moments
    @moments.each {|moment| yield moment}
  end

  def renderOn(brush)
    brush.render :before
    currentLane = @start
    self.moments {|moment|
      moment.renderOn brush
      currentLane = moment.nextLane(currentLane)
      brush.render :inbetween, currentLane
    }
    brush.render :after
  end
end
