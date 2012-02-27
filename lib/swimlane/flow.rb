class Flow
  attr_reader :lane
  def initialize(lane)
    @lane = lane
  end

  def renderOn(brush)
    brush.lanes {|lane|
      brush.render :flow, @lane == lane
    }
  end
end

class StartFlow < Flow
  def initialize(start)
    super(start)
  end

  def renderOn(brush)
    brush.lanes { brush.render :before }
  end
end

class FinishFlow
  def renderOn(brush)
    brush.lanes { brush.render :after }
    brush.render :inbetween
  end
end

class NullFlow
  def renderOn(brush)
    # do nothing
  end
end
