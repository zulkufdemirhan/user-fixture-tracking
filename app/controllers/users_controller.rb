class UsersController < ApplicationController
  before_action :set_user, except: [:index, :new, :create]
  before_action :ensure_frame_response, only: [:new, :edit]

  def index
    @users = User.all.order(id: :desc)
    @pagy, @users = pagy(@users, items: 5)
    rescue Pagy::OverflowError
      redirect_to root_path(page: 1)
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash.now[:notice] = 'User was successfully created.'
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash.now[:notice] = 'User was successfully updated.'
    end
  end

  def destroy
    if @user.destroy
      flash.now[:alert] = 'User was successfully deleted.'
    end 
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :job, :email, :phone, :status, :entry_date)
  end
  
  def ensure_frame_response
    return unless Rails.env.development?
    redirect_to root_path unless turbo_frame_request?
  end
end