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
      lanes {@representation << ".___. "}
      @representation << "\n"
    elsif token == :inbetween
      @representation << "\n"
      currentLane, last = arguments[0], arguments[1]
      if (not last and @lanes.include?(currentLane))
        @lanes.each {|lane|
          self.render :flow, currentLane == lane
        }
        @representation << "\n"
      end
    elsif token == :after
      lanes {@representation << "|___| "}
      @representation << "\n"
    end
  end

  def to_s
    return @representation.join
  end
end
