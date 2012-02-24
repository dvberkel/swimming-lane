require 'set'

class Diagram
  attr_reader :lanes
  def initialize
    @lanes = Set.new
  end

  def add(moment)
    @lanes.merge(moment.lanes)
  end

  def lanes
    @lanes
  end
end
