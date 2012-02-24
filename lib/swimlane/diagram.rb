require 'set'

class Diagram
  attr_reader :lanes
  def initialize
    @moments = []
  end

  def add(moment)
    @moments << moment
  end

  def moments
    @moments.each {|moment| yield moment}
  end

  def lanes
    lanes = Set.new
    self.moments {|moment| lanes.merge(moment.lanes)}
    lanes
  end

  def renderOn(brush)
    self.moments {|moment|
      moment.renderOn brush
      brush.render :inbetween
    }
  end
end
