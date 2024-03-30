class GenresService
  class << self

    def index params
      response = Genre.paginate(page: params[:page] || 1, per_page: params[:per_page] || 50)
      { status: 200, data: { success: true, response: }} 
    end
  end
end