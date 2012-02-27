require 'set'
require 'flow'

class Moment
  attr_reader :lanes
  attr_accessor :inFlow, :outFlow
  def initialize(*lanes)
    @lanes = Set.new (lanes || [])
    @inFlow = NullFlow.new
    @outFlow = FinishFlow.new
  end

  def flowTo(moment)
    flow = Flow.new(nextLane(inFlow.lane))
    @outFlow = flow
    moment.inFlow = flow
  end

  def nextLane(currentLane)
    laneLike(currentLane).transition.to || currentLane
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
    brush.render :inbetween
    brush.lanes { |this|
      lane = self.laneLike this
      lane.renderOn brush
    }
    brush.render :inbetween
    outFlow.renderOn brush
  end
end

class NullMoment
  def initialize(start)
    @start = start
  end

  def flowTo(moment)
    flow = StartFlow.new(@start)
    moment.inFlow = flow    
  end
end
