class DrawersController < PermissionsController
  before_action :authenticate_user!, except: %i[index show]
  before_action :user_not_authorized, only: %i[create update destroy]
  before_action :set_drawer, only: %i[update destroy]

  def index
    @drawers = Drawer.all
    if @drawers
      render json: { success: true, data: @drawers }, status: :ok
    else
      render json: { success: false, data: "[]" }
    end
  end

  def show
    @drawer = Drawer.find_by(id: params[:id])
    if @drawer
      render json: { status: 200, data: @drawer }
    else
      render json: { status: 404, data: "[]" }
    end
  end

  def create
    @sub_category = SubCategory.find_by(id: params[:sub_category_id])
    @drawer = @sub_category.drawers.create(drawer_params)
    if @drawer.save
      render json: { success: true, message: "Drawer created successfully", data: @drawer }, status: :created
    else
      render json: { success: false, message: "Drawer not created", data: @drawer.errors }, status: :unprocessable_entity
    end
  end

  def update
    if @drawer.update(drawer_params)
      render json: { success: true, message: "Drawer updated successfully", data: @drawer }, status: :ok
    else
      render json: { success: false, message: "Drawer not updated", data: @drawer.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    if @drawer.destroy
      render json: { success: true, message: "Drawer deleted successfully", data: @drawer }, status: :ok
    else
      render json: { success: false, message: "Drawer not deleted", data: @drawer.errors }, status: :unprocessable_entity
    end
  end

  private

  def set_drawer
    @drawer = Drawer.find_by(id: params[:id])
  end

  def drawer_params
    params.require(:drawer).permit(:name, :description, :sub_category_id)
  end
end
