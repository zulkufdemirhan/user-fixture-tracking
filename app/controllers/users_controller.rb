class UsersController < ApplicationController
  include ActionView::RecordIdentifier
  before_action :set_user, except: [:index, :new, :create]
  before_action :ensure_frame_response, only: [:new, :edit]

  def index
    @users = User.all.order(id: :desc)
    @pagy, @users = pagy(@users, items: 5)

    count_users_by_status
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
      update_index
      count_users_by_status
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash.now[:notice] = 'User was successfully updated.'
      count_users_by_status
    end
  end

  def destroy
    if @user.destroy
      flash.now[:alert] = 'User was successfully deleted.'
      update_index
      count_users_by_status
    end 
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:user_photo, :name, :job, :email, :phone, :status, :entry_date)
  end
  
  def ensure_frame_response
    return unless Rails.env.development?
    redirect_to root_path unless turbo_frame_request?
  end

  def update_index
    @users = User.all.order(id: :desc)
    @pagy, @users = pagy(@users, items: 5)
  end

  def count_users_by_status
    @on_leave_users  = User.count_by_status("On Leave")
    @on_site_users   = User.count_by_status("On Site")
    @remote_users    = User.count_by_status("Remote")
  end
end