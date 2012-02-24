require 'set'

class Moment
  attr_reader :lanes
  def initialize(*lanes)
    @lanes = Set.new lanes
  end
end
