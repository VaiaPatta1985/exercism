class Microwave
  def initialize(time_raw_number)
    raw_seconds = time_raw_number % 100
    seconds = raw_seconds % 60
    minutes = (time_raw_number - raw_seconds) / 100 + (raw_seconds >= 60 ? 1 : 0)
    @timer = '%02d:%02d' % [minutes, seconds]
  end

  attr_accessor :timer
end
