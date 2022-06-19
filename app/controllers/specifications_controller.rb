class SpecificationsController < PermissionsController
    # before_action :authenticate_user!, except: %i[index show]
    # before_action :user_not_authorized, only: %i[create update destroy]
    # before_action :set_specification, only: %i[update destroy]

    def index
        @boxes = Box.all
        @key_features = KeyFeature.all
         if @boxes && @key_features
            render json: { success: true, boxes: @boxes, key_features: @key_features }, status: :ok
        else
            render json: { success: false, data: "[]" }
        end

    end

    # def show
    #     @specification = Specification.find_by(id: params[:id])
    #     if @specification
    #         render json: { status: 200, data: @specification }
    #     else
    #         render json: { status: 404, data: "[]" }
    #     end
    # end

    # def create
    #     @post = Post.find_by(id: params[:post_id])
    #     @specification = @post.specifications.create(specification_params)
    #     if @specification.save
    #         render json: { success: true, message: "Specification created successfully", data: @specification }, status: :created
    #     else
    #         render json: { success: false, message: "Specification not created", data: @specification.errors }, status: :unprocessable_entity
    #     end
    # end

    # def update
    #     if @specification.update(specification_params)
    #         render json: { success: true, message: "Specification updated successfully", data: @specification }, status: :ok
    #     else
    #         render json: { success: false, message: "Specification not updated", data: @specification.errors }, status: :unprocessable_entity
    #     end
    # end

    # def destroy
    #     if @specification.destroy
    #         render json: { success: true, message: "Specification deleted successfully", data: @specification }, status: :ok
    #     else
    #         render json: { success: false, message: "Specification not deleted", data: @specification.errors }, status: :unprocessable_entity
    #     end
    # end

    # private

    # def set_specification
    #     @specification = Specification.find_by(id: params[:id])
    # end

    # def specification_params
    #     params.require(:specification).permit(:post_id)
    # end

end
