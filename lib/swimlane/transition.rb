class Transition
  attr_reader :from, :to
  def initialize(from, to)
    @from = from
    @to = to
  end

  def ==(lane)
    self.from == lane.from and self.to == lane.to
  end
end

class NullTransition
end
