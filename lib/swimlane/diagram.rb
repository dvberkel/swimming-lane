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
    currentLane, count = @start, 0
    self.moments {|moment|
      count += 1
      moment.renderOn brush
      currentLane = moment.nextLane(currentLane)
      brush.render :inbetween, currentLane, count == @moments.length
    }
    brush.render :after
  end
end
