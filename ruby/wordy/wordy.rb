class WordProblem
  attr_reader :problem

  def initialize(problem)
    @problem = problem
  end

  def answer
    raise ArgumentError unless problem_starts_correctly?

    numbers = problem.scan(/-?\d+/).map(&:to_i)
    operations = problem.scan(/[a-zA-Z ]+/)[1..-1].map(&:strip)

    result = numbers.shift
    calculations = operations.zip(numbers)

    calculations.each do |operation, n|
      case operation
      when "plus" then result += n
      when "minus" then result -= n
      when "multiplied by" then result *= n
      when "divided by" then result /= n
      else raise ArgumentError
      end
    end

    result
  end

  private

  def problem_starts_correctly?
    problem.match?(/^What is /)
  end
end
