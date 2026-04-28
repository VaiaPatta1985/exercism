class Clock
  TIME_FORMAT = '%02<hour>u:%02<minute>u'
  
  attr_accessor :hour
  attr_accessor :minute

  def initialize(hour: 0, minute: 0)
    self.minute = minute % 60
    self.hour = (hour + (minute - self.minute) / 60) % 24
  end

  def to_s
    TIME_FORMAT % {hour: self.hour, minute: self.minute}
  end

  def +(other)
    Clock.new(hour: self.hour + other.hour, minute: self.minute + other.minute)
  end

  def -(other)
    Clock.new(hour: self.hour - other.hour, minute: self.minute - other.minute)
  end

  def ==(other)
    self.hour == other.hour and self.minute == other.minute
  end

end
