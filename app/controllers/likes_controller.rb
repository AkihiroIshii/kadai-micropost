class LikesController < ApplicationController
  before_action :require_user_logged_in
  
  def index
    @likes = Like.where(user_id: current_user.id).page(params[:page])
    #@likes = Like.all.page(params[:page])
  end

  def create
    micropost = Micropost.find(params[:micropost_id])
    current_user.add_like(micropost)
    flash[:success] = 'お気に入りに追加しました。'
    redirect_to root_url
  end

  def destroy
    micropost = Micropost.find_by(params[:micropost_id])
    current_user.remove_like(micropost)
    flash[:success] = 'お気に入りを解除しました。'
    redirect_to root_url
  end
end
