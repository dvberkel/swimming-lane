require 'set'

class Moment
  attr_reader :lanes
  def initialize(*lanes)
    transistions = lanes.first
    lanes = lanes.slice(1..-1) || []
    @lanes = Set.new lanes
    if (transistions.is_a? Hash)
      @transitions = transistions
      @transitions.each {|key, value|
        @lanes.add key
        @lanes.add value
      }
    else
      @lanes.add(transistions)
    end
  end
  
  def transitions
    @transitions
  end
end
