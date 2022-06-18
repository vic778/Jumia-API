class CategoriesController < PermissionsController
    before_action :authenticate_user!, except: [:index, :show]
    before_action :user_not_authorized, only: [:create, :update, :destroy]
    before_action :set_category, only: [:update, :destroy]
  

    def index 
        @categories = Category.all
        if @categories
            render json: {success: true, data: @categories}, status: :ok
        else
            render json: {success: false, data: "[]"}
        end
    end

    def show
        @category = Category.find_by(id: params[:id])
        if @category
            render json: {status: 200, data: @category}
        else
            render json: {status: 404, data: "[]"}
        end
    end

    def create
        @category = Category.create(category_params.merge(user_id: current_user.id))
     
        if @category.save
            render json: {success: true, message: "Category created successfully", data: @category}, status: :created
        else
            render json: {success: false, message: "Category not created", data: @category.errors}, status: :unprocessable_entity
        end
    end

    def update
        if @category.update(category_params)
            render json: {success: true, message: "Category updated successfully", data: @category}, status: :ok
        else
            render json: {success: false, message: "Category not updated", data: @category.errors}, status: :unprocessable_entity
        end
    end

    def destroy
        if @category.destroy
            render json: {success: true, message: "Category deleted successfully", data: @category}, status: :ok
        else
            render json: {success: false, message: "Category not deleted", data: @category.errors}, status: :unprocessable_entity
        end
    end

    private

    def set_category
        @category = @user.categories.find_by(id: params[:id])
    end

    def category_params
        params.require(:category).permit(:name)
    end

end
