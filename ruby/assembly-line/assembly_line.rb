class AssemblyLine
  RATE_PER_UNIT_SPEED = 221

  def initialize(speed)
    @speed = speed
  end

  def production_rate_per_hour
    if @speed <= 4
      base_production_rate_per_hour
    elsif @speed <= 8
      base_production_rate_per_hour * 0.9
    elsif @speed == 9
      base_production_rate_per_hour * 0.8
    else # @speed == 10
      base_production_rate_per_hour * 0.77
    end
  end

  def working_items_per_minute
    (production_rate_per_hour / 60.0).floor
  end

  private def base_production_rate_per_hour
    @speed * RATE_PER_UNIT_SPEED
  end
end
