class MoviesResponse
  class << self

    def formualte_response movie
      response = {}
      response[:details] = movie
      response[:creators] = movie.creators
      response[:genres] = movie.genres
      response
    end
  end
end