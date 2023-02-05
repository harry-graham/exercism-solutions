# This is a custom exception that you can use in your code
class NotMovieClubMemberError < RuntimeError
end

class Moviegoer
  def initialize(age, member: false)
    @age = age
    @member = member
  end

  def ticket_price
    age >= 60 ? 10 : 15
  end

  def watch_scary_movie?
    age >= 18
  end

  def claim_free_popcorn!
    member ? "🍿" : (raise NotMovieClubMemberError.new)
  end

  private attr_reader :age, :member
end
