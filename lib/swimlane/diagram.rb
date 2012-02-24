require 'set'

class Diagram
  attr_reader :lanes
  def initialize
    @lanes = Set.new
    @moments = []
  end

  def add(moment)
    @lanes.merge(moment.lanes)
    @moments << moment
  end

  def moments
    @moments.each {|moment| yield moment}
  end

  def lanes
    @lanes
  end
end
