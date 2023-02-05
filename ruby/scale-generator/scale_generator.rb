class Scale
  attr_reader :tonic

  EXPRESSED_AS = {
    sharps: %w[A B C D E F# G a b c# d# e f# g#],
    flats: %w[Ab Bb Db Eb F Gb bb c d eb f g]
  }.freeze

  CHROMATIC_SCALE = {
    sharps: %w[A A# B C C# D D# E F F# G G#],
    flats: %w[A Bb B C Db D Eb E F Gb G Ab]
  }.freeze

  STEP_SIZE = {"m" => 1, "M" => 2, "A" => 3}

  def initialize(tonic)
    @tonic = tonic
  end

  def chromatic
    generate_scale("m" * 12)
  end

  def interval(steps)
    generate_scale(steps, finish_at_start: true)
  end

  private

  def generate_scale(intervals, finish_at_start: false)
    index = scale.index(tonic.capitalize)
    result = intervals.chars.each_with_object([]) do |step, notes|
      notes << scale[index % 12]
      index += STEP_SIZE[step]
    end
    result << scale[index % 12] if finish_at_start
    result
  end
  
  def scale
    CHROMATIC_SCALE[notation_type]
  end

  def notation_type
    EXPRESSED_AS.find { |k, v| v.include?(tonic) }.first
  end
end
