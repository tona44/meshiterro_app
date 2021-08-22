class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @post_images = @user.post_images.page(params[:page]).reverse_order  # 個人投稿のみ抽出
  end
end
