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

  def flowTo(moment)
    
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
  end
end

class NullMoment
  def initialize(start)
    @start = start
  end

  def flowTo(moment)
    
  end
end
