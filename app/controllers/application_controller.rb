class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :create_ransack_object
  
  include SessionsHelper
  
  def create_ransack_object
    @search = Question.ransack(params[:q])
  end

  private
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end
end
