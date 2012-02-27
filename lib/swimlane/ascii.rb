class AsciiBrush
  def initialize(*lanes)
    @lanes = lanes
    @representation = []
  end

  def lanes
    @lanes.each {|lane| yield lane}
  end

  def render(token, *arguments)
    if token == :empty
      @representation << " "
    elsif token == :screen
      @representation << "*"
    elsif token == :lane
      @representation << "| "
      arguments[0].renderOn self
      @representation << " |"
    elsif token == :flow
      @representation << "| "
      @representation << (arguments[0] ? "|" : " ")
      @representation << " | "
    elsif token == :transition
      @representation << (arguments[0] ? "-" : " ")
    elsif token == :before
      @representation << ".___. "
    elsif token == :inbetween
      @representation << "\n"
    elsif token == :after
      @representation << "|___| "
    end
  end

  def to_s
    return @representation.join
  end
end
