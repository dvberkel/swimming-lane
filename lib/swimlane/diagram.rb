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
    self.moments {|moment|
      moment.renderOn brush
      brush.render :inbetween
    }
  end
end
