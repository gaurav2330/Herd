class CreatorsService
  class << self

    def index params
      response = Creator.paginate(page: params[:page] || 1, per_page: params[:per_page] || 50)
      { status: 200, data: { success: true, response: }} 
    end
  end
end