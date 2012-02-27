class Flow
  attr_reader :lane
  def initialize(lane)
    @lane = lane
  end

  def renderOn(brush)
  end
end

class NullFlow
  def renderOn(brush)
    # do nothing
  end
end
