module Keepable
  def keep(&block)
    return to_enum(:keep) unless block_given?

    i = 0
    result = []
    while i < size
      val = at(i)
      result << val if block.call(val)
      i += 1
    end
    result
  end
end

module Discardable
  def discard(&block)
    return to_enum(:discard) unless block_given?

    i = 0
    result = []
    while i < size
      val = at(i)
      result << val unless block.call(val)
      i += 1
    end
    result
  end
end

Array.include(Keepable)
Array.include(Discardable)
