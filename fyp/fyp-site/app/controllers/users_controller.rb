class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update]
  before_action :correct_user, only: [:edit, :update]

#rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @assignment = Assignment.new
    if @user.save
      redirect_to @user
    else
      render :new
    end
  end

  private
    def user_params
      params.require(:user).permit(:username, :email, :name,
                                    :password, :password_confirmation)
    end

    def logged_in_user
      unless logged_in?
        flash[:danger] = "Please log in to continue."
        redirect_to login_url
      end
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

    def user_not_authorized
      policy_name = exception.policy.class.to_s.underscore
      flash[:warning] = t "#{policy_name}.#{exception.query}", scope: "pundit", default: :default
      redirect_to(root_path)
    end
end
