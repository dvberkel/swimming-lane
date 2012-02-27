class Screen
  attr_reader :description
  def initialize(description)
    @description = description
  end

  def renderOn(brush)
    brush.render :screen, @description
  end
end

class NullScreen
  def renderOn(brush)
    brush.render :empty
  end
end
