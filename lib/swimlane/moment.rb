require 'set'

class Moment
  attr_reader :lanes, :transitions
  def initialize(*lanes)
    @transitions = lanes.first || {}
    @lanes = Set.new (lanes.slice(1..-1) || [])
    if (not @transitions.is_a? Hash)
      @lanes.add(@transitions)
      @transitions = {}
    end
    @transitions.each {|key, value|
      @lanes.add key
      @lanes.add value
    }
  end
end
