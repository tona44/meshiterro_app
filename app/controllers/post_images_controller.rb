class PostImagesController < ApplicationController
  
 def new
   @post_image = PostImage.new
 end
  
 def create
   @post_image = PostImage.new(post_image_params)
   @post_image.user_id = current_user.id    #投稿者とログイン中のユーザーを紐付ける
   @post_image.save
   redirect_to post_images_path
 end
  
 def index
  @post_images = PostImage.page(params[:page]).reverse_order
   # 1ページ分の決められた数のデータだけを、新しい順に取得する(kaminariインストール)
 end
 
 def show
  @post_image = PostImage.find(params[:id])
  @post_comment = PostComment.new
 end
 
 def destroy
  @post_image = PostImage.find(params[:id])
  @post_image.destroy
  redirect_to post_images_path
 end



 private
 
  def post_image_params
    params.require(:post_image).permit(:image,:shop_name,:caption)
  end


  
end
