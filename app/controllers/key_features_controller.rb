class KeyFeaturesController < PermissionsController
    before_action :authenticate_user!, except: %i[index show]
    before_action :user_not_authorized, only: %i[create update destroy]
    before_action :set_key_feature, only: %i[update destroy]

    def create
        @specification = Specification.find_by(id: params[:specification_id])
        @post = @specification.post if @specification
        @key_feature = @post.key_features.create(key_feature_params)
        if @key_feature.save
            render json: { success: true, message: "Key Feature created successfully", data: @key_feature }, status: :created
        else
            render json: { success: false, message: "Key Feature not created", data: @key_feature.errors }, status: :unprocessable_entity
        end
    end

    def update
        if @key_feature.update(key_feature_params)
            render json: { success: true, message: "Key Feature updated successfully", data: @key_feature }, status: :ok
        else
            render json: { success: false, message: "Key Feature not updated", data: @key_feature.errors }, status: :unprocessable_entity
        end
    end

    def destroy
        if @key_feature.destroy
            render json: { success: true, message: "Key Feature deleted successfully", data: @key_feature }, status: :ok
        else
            render json: { success: false, message: "Key Feature not deleted", data: @key_feature.errors }, status: :unprocessable_entity
        end
    end

    private

    def set_key_feature
        @key_feature = KeyFeature.find_by(id: params[:id])
    end

    def key_feature_params
        params.require(:key_feature).permit(:specification_id, :line, :line1, :line2, :line3, :line4, :line5, :line6, :line7, :line8, :post_id)
    end
end
