class SubCategoriesController < PermissionsController
    before_action :authenticate_user!, except: %i[index show]
    before_action :user_not_authorized, only: %i[create update destroy]
    before_action :set_sub_category, only: %i[update destroy]

    def index
        @sub_categories = SubCategory.all
        if @sub_categories
            render json: @sub_categories
        else
            render json: { error: '[]' }, status: 404
        end
    end

    def show
        @sub_category = SubCategory.find(params[:id])
        render json: @sub_category
    end

    def create
        @category = Category.find(params[:category_id])
        @sub_category = @category.sub_categories.create(sub_category_params)
        if @sub_category.save
            render json: {success: true, message: "Sub Category created successfully", data: @sub_category}, status: :created
        else
            render json: {success: false, message: "Sub Category not created", data: @sub_category.errors}, status: :unprocessable_entity
        end
    end

    def update
        if @sub_category.update(sub_category_params)
            render json: {success: true, message: "Sub Category updated successfully", data: @sub_category}, status: :ok
        else
            render json: {success: false, message: "Sub Category not updated", data: @sub_category.errors}, status: :unprocessable_entity
        end
    end

    def destroy
        @sub_category.destroy
        render json: {success: true, message: "Sub Category deleted successfully", data: @sub_category}, status: :ok
    end

    private

    def set_sub_category
        @sub_category = SubCategory.find(params[:id])
    end

    def sub_category_params
        params.require(:sub_category).permit(:name, :category_id)
    end

end
