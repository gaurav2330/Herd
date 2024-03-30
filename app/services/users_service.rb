class UsersService
  class << self

    def index params
      users = User.paginate(page: params[:page] || 1, per_page: params[:per_page] || 10)
      { status: 200, data: { success: true, users: }}
    end

    def show params
      user = User.where(id: params[:id]).first
      if user
        { status: 200, data: { success: true, user: }}
      else
        { status: 404, data: { success: false, error: "User not found" }}
      end
    end

    def create params
      user = User.new(params)
      if user.save
        { status: 200, data: { success: true, user: }}
      else
        { status: 422, data: { success: false, errors: user.errors.full_messages }}
      end
    end

    def update user_id, params
      user = User.where(id: user_id).first
      return { status: 404, data: { success: false, error: "User not found" }} unless user

      if user.update(params)
        { status: 200, data: { success: true, user: }}
      else
        { status: 422, data: { success: false, errors: user.errors.full_messages }}
      end
    end

    def destroy params
      user = User.where(id: params[:id]).first
      return { status: 404, data: { success: false, error: "User not found" }} unless user

      user.destroy
      { status: 204, data: {} }
    end
  end
end