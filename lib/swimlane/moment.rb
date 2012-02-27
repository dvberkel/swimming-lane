require 'set'
require 'flow'

class Moment
  attr_reader :lanes, :transitions
  attr_accessor :inFlow, :outFlow
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
    @inFlow = NullFlow.new
    @outFlow = NullFlow.new
  end

  def flowTo(moment)
    flow = Flow.new(nextLane(inFlow.lane))
    outFlow = flow
    moment.inFlow = flow
  end

  def nextLane(currentLane)
    @transitions[currentLane] || currentLane
  end
  
  def laneLike(aLane)
    result = NullLane.new
    @lanes.each { |lane|
      if lane == aLane
        result = lane
        break
      end
    }
    result
  end

  def renderOn(brush)
    brush.lanes { |this|
      lane = self.laneLike this
      lane.renderOn brush
      brush.render :transition, @transitions.has_key?(lane)
    }
    outFlow.renderOn brush
  end
end

class NullMoment
  def initialize(start)
    @start = start
  end

  def flowTo(moment)
    flow = Flow.new(@start)
    moment.inFlow = flow    
  end
end
