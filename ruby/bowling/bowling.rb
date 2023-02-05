class Game
  class BowlingError < StandardError
  end

  MAX_FRAMES = 10
  MAX_PINS = 10

  def initialize
    @frames = []
  end

  def roll(pins)
    raise BowlingError unless valid_number_of_pins(pins)

    @frames << [] if start_of_new_frame?
    @frames.last << pins

    raise BowlingError if too_many_frames?
    raise BowlingError if frame_rolls_exceed_limit?(current_frame)
  end

  def score
    raise BowlingError unless game_finished?

    total = 0
    frame_array = @frames.dup

    frame_array.each_with_index do |frame, i|
      if frame.sum < MAX_PINS || i + 1 == MAX_FRAMES # final frame or basic score
        total += frame.sum
      elsif frame.size == 2 # spare
        total += frame.sum + frame_array[i+1][0]
      else # strike
        total += frame[0] + frame_array[i+1][0]
        total += (frame_array[i+1].size == 1 ? frame_array[i+2][0] : frame_array[i+1][1])
      end
    end

    total
  end

  private

  def valid_number_of_pins(pins)
    pins >= 0 && pins <= MAX_PINS
  end

  def game_started?
    @frames.any?
  end

  def game_finished?
    final_frame? && frame_finished?(current_frame, final: true)
  end

  def current_frame
    @frames.last
  end

  def final_frame?
    @frames.size == MAX_FRAMES
  end

  def start_of_new_frame?
    !game_started? || frame_finished?(current_frame, final: final_frame?)
  end

  def frame_finished?(frame, final: false)
    if final
      final_frame_finished?(current_frame)
    else
      non_final_frame_finished?(current_frame)
    end
  end

  def final_frame_finished?(frame)
    if frame.size < 2
      false
    elsif frame.size == 2
      frame.sum < MAX_PINS
    else
      true
    end
  end

  def non_final_frame_finished?(frame)
    frame.size == 2 || frame.sum == MAX_PINS
  end

  def frame_rolls_exceed_limit?(frame)
    return false if frame.size < 2
    return rolls_exceed_limit?(frame[0], frame[1]) unless final_frame?

    # Final frame
    if frame[0] < MAX_PINS
      rolls_exceed_limit?(frame[0], frame[1])
    elsif frame[1] != MAX_PINS && frame.size == 3
      rolls_exceed_limit?(frame[1], frame[2])
    else
      false
    end
  end

  def rolls_exceed_limit?(roll_1, roll_2)
    roll_1 + roll_2 > MAX_PINS
  end

  def too_many_frames?
    @frames.size > MAX_FRAMES
  end
end
