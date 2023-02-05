class Darts
  def initialize(x, y)
    @x = x
    @y = y
    @radius = distance_from_centre
  end

  def score
    if @radius > 10
      0
    elsif @radius > 5
      1
    elsif @radius > 1
      5
    else
      10
    end
  end

  private

  def distance_from_centre
    Math.sqrt((@x ** 2) + (@y ** 2))
  end
end
