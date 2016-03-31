class Users::PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: [:show, :edit, :update, :destroy, :upload_photo, :update_attachment, :preview, :publish, :unpublish]

  def index
    @posts = current_user.posts.all
  end

  # def show
  # end

  def remind_for_draft # 作為到新刊登之前的緩衝，避免使用者持續重新刊登
    if current_user.has_draft?
      redirect_to posts_path
    else
      redirect_to new_post_path
    end
  end

  # GET /posts/new
  def new
    current_user.posts.new.save(validate: false) unless current_user.has_draft?
    @post = current_user.posts.draft.first
  end

  # GET /posts/1/edit
  def edit
  end

  def update
    respond_to do |format|
      # byebug
      # 注意此處不可用 @post.update_columns
      # 因為 update_columns 不會將 enum 從字串轉為整數
      # 但驗證時又需要驗證字串，所以改用 assign + save
      if Post.valid_attributes?(post_params) && (@post.attributes = post_params) && @post.save(validate:false)
        format.html { 
          if @post.valid?
            redirect_to upload_photo_post_path(@post)
          else
            redirect_to edit_post_path(@post)
          end
        }
        format.json { render :show, status: :ok, location: @post }
      end
    end
  end

  # def create
  #   @post = current_user.posts.new(post_params)

  #   respond_to do |format|
  #     if Post.valid_attributes?(post_params) && @post.save(validate: false)
  #       if @post.valid?
  #         format.html { redirect_to upload_photo_post_path(@post), notice: 'Post was successfully created.' }
  #         format.json { render :show, status: :created, location: @post }
  #       else
  #         format.html { redirect_to edit_post_path(@post) }
  #         # format.html { render :new }
  #         # format.json { render json: @post.errors, status: :unprocessable_entity }
  #       end
  #     end
  #   end
  # end

  def upload_photo
    redirect_to edit_post_path(@post) unless @post.valid?
  end

  def update_attachment
    respond_to do |format|
      if params[:file]
        params[:file].each { |picture| @post.attachments.create(:image => picture) }
      end
      format.html { redirect_to upload_photo_post_path }
      format.json { render :upload_photo, status: :created, location: @post }
    end
  end

  def preview
    if @post.publish?
      redirect_to posts_path
    elsif @post.draft?
      if @post.can_publish? # 檢查各屬性及圖片數量大於 1
        @post.hidden!
      elsif @post.attachments_count.zero?
        redirect_to upload_photo_post_path(@post)
      else
        redirect_to edit_post_path(@post)
      end
    end
  end

  def publish
    if @post.can_publish?
      @post.publish!
      flash[:success] = "發佈成功。"
      redirect_to root_path
    else
      redirect_to :back
    end
  end

  def unpublish
    @post.hidden!
    redirect_to :back
  end

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
      redirect_to profile_path unless @post.present?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:city, :address, :price, :description, :state, :availability, :post_type, :author_id, :token, :attachments_count)
    end
end
