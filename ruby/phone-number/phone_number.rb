# From https://exercism.org/tracks/ruby/exercises/phone-number/solutions/lujanfernaud
class PhoneNumber
  VALID_PHONE_NUMBER_REGEX = /^([2-9]\d\d){2}\d{4}$/

  class << self
    def clean(phone_number)
      cleaned(phone_number)[VALID_PHONE_NUMBER_REGEX]
    end

    private

    def cleaned(phone_number)
      phone_number.gsub(/\D/, "").sub(/^1/, "")
    end
  end
end
