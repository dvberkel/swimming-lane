require 'set'

class Moment
  def initialize(*lanes)
    @lanes = Set.new lanes
  end

  def lanes
    @lanes
  end
end
