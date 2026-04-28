class SpaceAge
  SECONDS_IN_A_YEAR_ON_EARTH = 31557600.0

  ORBITAL_PERIOD_IN_EARTH_YEARS = {Mercury: 0.2408467, Venus: 0.61519726, Mars: 1.8808158, Jupiter: 11.862615, Saturn: 29.447498, Uranus: 84.016846, Neptune: 164.79132}

  attr_accessor :on_mercury
  attr_accessor :on_venus
  attr_accessor :on_earth
  attr_accessor :on_mars
  attr_accessor :on_jupiter
  attr_accessor :on_saturn
  attr_accessor :on_uranus
  attr_accessor :on_neptune
  
  def initialize(seconds)
    self.on_earth = seconds / SECONDS_IN_A_YEAR_ON_EARTH
    self.on_mercury = on_earth / ORBITAL_PERIOD_IN_EARTH_YEARS[:Mercury]
    self.on_venus = on_earth / ORBITAL_PERIOD_IN_EARTH_YEARS[:Venus]
    self.on_mars = on_earth / ORBITAL_PERIOD_IN_EARTH_YEARS[:Mars]
    self.on_jupiter = on_earth / ORBITAL_PERIOD_IN_EARTH_YEARS[:Jupiter]
    self.on_saturn = on_earth / ORBITAL_PERIOD_IN_EARTH_YEARS[:Saturn]
    self.on_uranus = on_earth / ORBITAL_PERIOD_IN_EARTH_YEARS[:Uranus]
    self.on_neptune = on_earth / ORBITAL_PERIOD_IN_EARTH_YEARS[:Neptune]    
  end
end
