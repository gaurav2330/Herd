class MoviesService
  class << self

    def index params
      if params[:creator_id]
        creator = Creator.where(id: params[:creator_id]).first
        return { status: 404, data: { success: false, error: 'Creator not found' } } unless creator.present?
        
        response = creator.movies.paginate(page: params[:page] || 1, per_page: params[:per_page] || 50)
      elsif params[:genre_id]
        genre = Genre.where(id: params[:genre_id]).first
        return { status: 404, data: { success: false, error: 'Genre not found' } } unless genre.present?
        
        response = genre.movies.paginate(page: params[:page] || 1, per_page: params[:per_page] || 50)
      else
        response = Movie.paginate(page: params[:page] || 1, per_page: params[:per_page] || 50)
      end
      { status: 200, data: { success: true, response: }} 
    end

    def show params
      movie = Movie.where(id: params[:id]).first
      return { status: 404, data: { success: false, error: "Movie not found" }} unless movie.present?

      response = MoviesResponse.formualte_response movie
      { status: 200, data: { success: true, response: }}
    end
  end
end