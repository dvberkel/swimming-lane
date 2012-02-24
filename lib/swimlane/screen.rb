class Screen
  attr_reader :description
  def initialize(description)
    @description = description
  end

  def renderOn(brush)
    brush.render :screen, @description
  end

  def ==(screen)
    self.eql?(screen)
  end

  def eql?(screen)
    self.description == screen.description
  end

  def hash
    @description.hash
  end
end

class NullScreen
  def renderOn(brush)
    brush.render :empty
  end
end
