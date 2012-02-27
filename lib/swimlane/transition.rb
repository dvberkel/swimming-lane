class Transition
  attr_reader :from, :to
  def initialize(from, to)
    @from = from
    @to = to
  end

  def renderOn(brush)
    brush.render :transition, true
  end

  def ==(lane)
    self.from == lane.from and self.to == lane.to
  end
end

class NullTransition
  def to
    nil
  end

  def renderOn(brush)
    brush.render :empty
  end
end
