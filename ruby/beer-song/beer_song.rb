class InvalidInputError < StandardError; end

class BeerSong
  def self.recite(start_count, num_verses)
    end_count = start_count - num_verses + 1
    raise InvalidInputError if end_count.negative?

    new.verses(start_count, end_count)
  end

  def verses(start_count, end_count)
    [*start_count.downto(end_count)]
      .map { |n| verse(n) }
      .join("\n")
  end

  def verse(n)
    "#{subject(n).capitalize} of beer on the wall, " +
    "#{subject(n)} of beer.\n" +
    "#{action_statement(n)}, " +
    "#{subject(n-1)} of beer on the wall.\n"
  end

  private

  def subject(n)
    case n
    when -1 then "99 bottles"
    when 0 then "no more bottles"
    when 1 then "1 bottle"
    else "#{n} bottles"
    end
  end

  def action_statement(n)
    case n
    when 0 then "Go to the store and buy some more"
    when 1 then "Take it down and pass it around"
    else "Take one down and pass it around"
    end
  end
end
