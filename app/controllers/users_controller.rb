class UsersController < PermissionsController
  before_action :authenticate_user!

  def index
    @users = User.all
    render json: @users
  end

  def show; end

  def update
    if current_user.update!(user_params)
      render json: {
        user: current_user
      }
    else
      render json: { errors: current_user.errors }, status: :unprocessable_entity
    end
  end

  def auto_login
    render json: {
      user: current_user
    }
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :name, :profile, :bio)
  end
end