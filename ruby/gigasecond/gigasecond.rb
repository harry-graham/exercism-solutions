class Gigasecond
  class << self
    def from(datetime)
      datetime + 1_000_000_000
    end
  end
end
