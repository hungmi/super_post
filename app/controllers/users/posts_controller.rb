class Users::PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy, :upload_photo, :update_attachment, :preview, :publish]
  before_action :authenticate_user!

  # GET /posts
  # GET /posts.json
  def index
    @posts = current_user.posts.all
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = current_user.posts.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = current_user.posts.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to upload_photo_post_path(@post), notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def upload_photo
  end

  def update_attachment
    if params[:file]
      params[:file].each { |picture| @post.attachments.create(:image => picture) }
    end
    redirect_to upload_photo_post_path
  end

  def preview
  end

  def publish
    @post.publish!
    redirect_to posts_path, notice: "成功刊登！"
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to upload_photo_post_path(@post), notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = current_user.posts.find_by_id(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:city, :address, :price, :description, :state, :availability, :post_type, :author_id, :token, :attachments_count)
    end
end
