const SECONDS_PER_EARTH_YEAR = 31557600;

const ORBITAL_PERIODS_IN_EARTH_YEARS: { [key: string]: number } = {
  'mercury': 0.2408467,
  'venus': 0.61519726,
  'earth': 1,
  'mars': 1.8808158,
  'jupiter': 11.862615,
  'saturn': 29.447498,
  'uranus': 84.016846,
  'neptune': 164.79132,
};

function earth_years(seconds: number): number {
  return seconds / SECONDS_PER_EARTH_YEAR;
}

function planet_years(planet: string, seconds: number): number {
  return earth_years(seconds) / ORBITAL_PERIODS_IN_EARTH_YEARS[planet];
}

function roundTo2dp(n: number): number {
  return Math.round(n * 100) / 100;
}

export function age(planet: string, seconds: number): number {
  return roundTo2dp(planet_years(planet, seconds));
}
