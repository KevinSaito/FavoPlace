class Public::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:edit, :update,:favorites]

  def show
    @user = User.find(params[:id])
    @favo_images = @user.favo_images.page(params[:page]).reverse_order
    @following_users = @user.following_user
    @follower_users = @user.follower_user
  end

  def index
    @users = User.page(params[:page])
  end

  def favorites
    @user = User.find(params[:id])
    @favo_images = @user.favo_images.page(params[:page])
    favorites = Favorite.where(user_id: current_user.id).pluck(:favo_image_id)
    # ページネーションのやり方がわからなくなってしまった
    @favorite_list = FavoImage.find(favorites).reverse
    @favorite_lists = Kaminari.paginate_array(favorites).page(params[:page])
    
    
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  def follows
    user = User.find(params[:id])
    @users = user.following_user.page(params[:page]).per(3).reverse_order
  end

  def followers
    user = User.find(params[:id])
    @users = user.follower_user.page(params[:page]).per(3).reverse_order
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def ensure_correct_user
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user)
    end
  end
end
