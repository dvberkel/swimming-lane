require 'set'

class Diagram
  attr_reader :start
  def initialize(start = NullLane.new)
    @moments = []
    @start = start
  end

  def add(moment)
    previousMoment.flowTo(moment)
    @moments << moment
  end

  def previousMoment
    @moments[-1] || NullMoment.new(@start)
  end

  def moments
    @moments.each {|moment| yield moment}
  end

  def renderOn(brush)
    brush.render :before
    currentLane, count = @start, 0
    self.moments {|moment|
      moment.renderOn brush
      currentLane, count = moment.nextLane(currentLane), count + 1
      brush.render :inbetween, currentLane, count == @moments.length
    }
    brush.render :after
  end
end
