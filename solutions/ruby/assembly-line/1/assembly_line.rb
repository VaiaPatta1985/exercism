class AssemblyLine
  CARS_PRODUCED_PER_HOUR_AT_UNIT_SPEED = 221
  def initialize(speed)
    @speed = speed
  end

  def success_rate
    if @speed<5
      return 1.0
    end
    if @speed<9
      return 0.9
    end
    if @speed<10
      return 0.8
    end
    return 0.77
  end
  
  def production_rate_per_hour
    return @speed * success_rate * CARS_PRODUCED_PER_HOUR_AT_UNIT_SPEED
  end

  def working_items_per_minute
    return (production_rate_per_hour / 60).floor
  end
end
