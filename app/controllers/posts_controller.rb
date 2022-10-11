class PostsController < PermissionsController
  before_action :authenticate_user!, except: %i[index show]
  before_action :user_not_authorized, only: %i[create update destroy]
  before_action :set_post, only: %i[update destroy]

  def index
    @posts = Post.all
    if @posts
      render json: { success: true, data: @posts }, status: :ok
    else
      render json: { success: false, data: "[]" }
    end
  end

  def show
    @post = Post.find(params[:id])
    if @post
      render json: { status: 200, data: @post }
    else
      render json: { status: 404, data: "[]" }
    end
  end

  def create
    @drawer = Drawer.find(params[:drawer_id])
    @post = @drawer.posts.create(post_params)
    if @post.save
      render json: { success: true, message: "Post created successfully", data: @post }, status: :created
    else
      render json: { success: false, message: "Post not created", data: @post.errors }, status: :unprocessable_entity
    end
  end

  def update
    if @post.update(post_params)
      render json: { success: true, message: "Post updated successfully", data: @post }, status: :ok
    else
      render json: { success: false, message: "Post not updated", data: @post.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    if @post.destroy
      render json: { success: true, message: "Post deleted successfully", data: @post }, status: :ok
    else
      render json: { success: false, message: "Post not deleted", data: @post.errors }, status: :unprocessable_entity
    end
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :description, :model, :price, :connexion, :cpu, :gpu, :system, :battery, :camera, :memory, :display, :card_sim, :image, :drawer_id)
  end
end
