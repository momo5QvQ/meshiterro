class PostImagesController < ApplicationController
  def new
    @post_image = PostImage.new
  end

  # 投稿データの保存
  def create
    @postimage = PostImage.new(postimage_params)
    @postimage.user_id = current_user.id
    @postimage.save!
    redirect_to post_images_path
  end

  def index
    @post_images = PostImage.all
  end

  def show
    @post_image = PostImage.find(params[:id])
  end

  # 投稿データのストロングパラメータ
  private

  def postimage_params
    params.require(:post_image).permit(:shop_name, :image, :caption)
  end

end
