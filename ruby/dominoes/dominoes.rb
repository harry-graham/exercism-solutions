# Guided by https://exercism.org/tracks/ruby/exercises/dominoes/solutions/evanwhalen,
# which greatly influenced both the recursion idea and the algorithm.

class Dominoes
  class << self
    def chain?(dominoes)
      return true if dominoes.empty?

      forms_chain?(dominoes[0][0], dominoes[0][1], dominoes[1..-1])
    end

    def forms_chain?(head, tail, remaining)
      return head == tail if remaining.empty?

      remaining.each_with_index.any? do |domino, idx|
        next unless domino.include?(tail)

        new_remaining = remaining.dup
        new_remaining.delete_at(idx)

        new_tail = domino[0] == tail ? domino[1] : domino[0]
        
        forms_chain?(head, new_tail, new_remaining)
      end
    end
  end
end
