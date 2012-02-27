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

class NullFlow
  def renderOn(brush)
    # do nothing
  end
end
