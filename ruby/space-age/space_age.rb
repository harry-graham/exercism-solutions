class SpaceAge
  SECONDS_PER_EARTH_YEAR = 31_557_600
  ORBITAL_PERIODS = {
    mercury: 0.2408467,
    venus: 0.61519726,
    mars: 1.8808158,
    jupiter: 11.862615,
    saturn: 29.447498,
    uranus: 84.016846,
    neptune: 164.79132
  }.freeze

  def initialize(age_in_earth_seconds)
    @age_in_earth_seconds = age_in_earth_seconds.to_f
  end

  def on_earth
    @age_in_earth_seconds / SECONDS_PER_EARTH_YEAR
  end

  ORBITAL_PERIODS.keys.each do |planet_name|
    define_method("on_#{planet_name}") { years_on(planet_name) }
  end

  private

  def years_on(planet_name)
    on_earth / ORBITAL_PERIODS[planet_name]
  end
end
