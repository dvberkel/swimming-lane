require 'set'

class Diagram
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
