class TwoBucket
  attr_reader :moves, :goal_bucket, :other_bucket

  def initialize(size_1, size_2, target_volume, starting_bucket_label)
    @bucket_1 = Bucket.new(size: size_1, label: 'one')
    @bucket_2 = Bucket.new(size: size_2, label: 'two')
    @target_volume = target_volume

    @buckets = [@bucket_1, @bucket_2]
    @buckets.reverse! if starting_bucket_label == 'two'

    @moves = 0

    calculate_and_set_stats!
  end

  private

  def calculate_and_set_stats!
    while !target_volume_reached?
      @moves += 1
      perform_next_move!
    end

    set_results!
  end

  def perform_next_move!
    if starting_bucket.empty?
      starting_bucket.fill!
    elsif non_starting_bucket.empty? && non_starting_bucket.size == @target_volume
      non_starting_bucket.fill!
    elsif non_starting_bucket.full?
      non_starting_bucket.empty!
    else
      pour_starting_bucket_into_non_starting_bucket!
    end
  end

  def set_results!
    if starting_bucket.volume == @target_volume
      @goal_bucket = starting_bucket.label
      @other_bucket = non_starting_bucket.volume
    else
      @goal_bucket = non_starting_bucket.label
      @other_bucket = starting_bucket.volume
    end
  end

  def target_volume_reached?
    @buckets.any? { |bucket| bucket.volume == @target_volume }
  end

  def starting_bucket
    @buckets[0]
  end

  def non_starting_bucket
    @buckets[1]
  end

  def pour_starting_bucket_into_non_starting_bucket!
    amount_to_pour = [starting_bucket.volume, non_starting_bucket.volume_remaining].min

    starting_bucket.volume -= amount_to_pour
    non_starting_bucket.volume += amount_to_pour
  end
end

class Bucket
  attr_reader :size, :label
  attr_accessor :volume

  def initialize(size:, label:)
    @size = size
    @label = label
    @volume = 0
  end

  def empty?
    volume == 0
  end

  def full?
    volume == size
  end

  def empty!
    @volume = 0
  end

  def fill!
    @volume = size
  end

  def volume_remaining
    size - volume
  end
end
