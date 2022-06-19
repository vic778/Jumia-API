class BoxController < PermissionsController
    before_action :authenticate_user!, except: %i[index show]
    before_action :user_not_authorized, only: %i[create update destroy]
    before_action :set_box, only: %i[update destroy]


    def create
        @specification = Specification.find_by(id: params[:specification_id])
        @post = @specification.post if @specification
        @box = @post.boxes.create(box_params)
        if @box.save
            render json: { success: true, message: "Box created successfully", data: @box }, status: :created
        else
            render json: { success: false, message: "Box not created", data: @box.errors }, status: :unprocessable_entity
        end
    end

    def update
        if @box.update(box_params)
            render json: { success: true, message: "Box updated successfully", data: @box }, status: :ok
        else
            render json: { success: false, message: "Box not updated", data: @box.errors }, status: :unprocessable_entity
        end
    end

    def destroy
        if @box.destroy
            render json: { success: true, message: "Box deleted successfully", data: @box }, status: :ok
        else
            render json: { success: false, message: "Box not deleted", data: @box.errors }, status: :unprocessable_entity
        end
    end

    private

    def set_box
        @box = Box.find_by(id: params[:id])
    end

    def box_params
        params.require(:box).permit(:specification_id, :line, :line1, :line2, :line3, :line4, :line5, :line6, :line7, :line8, :post_id)
    end
end
