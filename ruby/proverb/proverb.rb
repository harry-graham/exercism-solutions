# Credit to community solution:
# https://exercism.org/tracks/ruby/exercises/proverb/solutions/BeggarsMattM
class Proverb
  attr_reader :chain, :qualifier

  def initialize(*chain, qualifier: nil)
    @chain = chain
    @qualifier = qualifier
  end

  def to_s
    chain.each_cons(2)
      .map { |wanted, lost| consequence_message(wanted, lost) }
      .push(final_consequence_message)
      .join("\n")
  end

  private

  def consequence_message(wanted, lost)
    "For want of a #{wanted} the #{lost} was lost."
  end

  def final_consequence_message
    "And all for the want of a #{qualifier} #{chain.first}.".squeeze(" ")
  end
end