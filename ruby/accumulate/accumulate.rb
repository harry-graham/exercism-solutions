module Accumulatable
  def accumulate(&block)
    return to_enum(:accumulate) unless block

    i = 0
    result = []
    while i < size
      result << block.call(at(i))
      i += 1
    end
    result
  end
end

Array.include(Accumulatable)
