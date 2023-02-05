class Bob
  class << self
    def hey(remark)
      remark = Remark.new(remark)
      if remark.blank?
        "Fine. Be that way!"
      elsif remark.is_shouted_question?
        "Calm down, I know what I'm doing!"
      elsif remark.is_question?
        "Sure."
      elsif remark.is_shouted?
        "Whoa, chill out!"
      else
        "Whatever."
      end
    end
  end
end

class Remark
  attr_reader :text

  def initialize(text)
    @text = text.strip.squeeze(" ")
  end

  def blank?
    text.empty?
  end

  def is_shouted_question?
    is_question? && is_shouted?
  end

  def is_question?
    text[-1] == "?"
  end

  def is_shouted?
    text == text.upcase && contains_letters?
  end

  def contains_letters?
    text.match?(/[a-zA-Z]/)
  end
end
