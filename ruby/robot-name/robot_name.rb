class Robot
  LETTERS = [*"A".."Z"]
  DIGITS = [*"0".."9"]

  @@names = []

  def self.forget
  end

  def name
    @name ||= new_name
  end

  def reset
    @name = nil
  end

  private

  def new_name
    result = nil
    loop do
      result = random_name
      next if @@names.include?(result)
      break
    end
    @@names << result
    result
  end

  def random_name
    result = ""
    2.times { result += select_random_from(LETTERS) }
    3.times { result += select_random_from(DIGITS) }
    result
  end

  def select_random_from(arr)
    arr[rand(arr.size)]
  end
end
