class SimpleCalculator
  ALLOWED_OPERATIONS = ['+', '/', '*'].freeze

  class UnsupportedOperation < StandardError
  end

  class << self
    def calculate(first_operand, second_operand, operation)
      check_operation_is_valid(operation)
      check_operands_are_valid(first_operand, second_operand)

      if second_operand == 0 && operation == "/"
        return "Division by zero is not allowed."
      end

      formatted_result(first_operand, second_operand, operation)
    end
  
    private
  
    def check_operation_is_valid(operation)
      unless ALLOWED_OPERATIONS.include?(operation)
        raise UnsupportedOperation.new
      end
    end
  
    def check_operands_are_valid(first_operand, second_operand)
      unless first_operand.is_a?(Integer) && second_operand.is_a?(Integer)
        raise ArgumentError.new
      end
    end
  
    def formatted_result(first_operand, second_operand, operation)
      result =
        case operation
        when "+" then first_operand + second_operand
        when "*" then first_operand * second_operand
        when "/" then first_operand / second_operand
        end
  
      "#{first_operand} #{operation} #{second_operand} = #{result}"
    end
  end
end
