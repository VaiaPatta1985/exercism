class NotMovieClubMemberError < RuntimeError
end

class Moviegoer
  def initialize(age, member: false)
    @age = age
    @member = member
  end

  def ticket_price
    @age<60?15:10
  end

  def watch_scary_movie?
    @age>=18
  end

  # Popcorn is 🍿
  def claim_free_popcorn!
    @member?(return "🍿"):(raise NotMovieClubMemberError.new('No popcorn for you!'))
  end
end
