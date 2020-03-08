class UsersController < ApplicationController
  require './app/commonclass/calc'
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      redirect_to new_plan_path
    else
      flash.now[:danger] = "登録に失敗しました"
      render :new
    end
  end
  
  def show
    set_info
    @per_year = @user.cal_target
    @per_month = @per_year / 12
    @graph_upper = @user.graph_upper
    @simu_params = @user.calc_simu_params
    @graph_params = @simu_params[0]
    @total_params = @simu_params[1]
    @ave_params = @simu_params[2]
  end
  
  def edit
    set_info
  end
  
  def update
    set_info
    if @user.update(user_params)
      redirect_to user_path, success: "ユーザー情報を編集しました"
    else
      flash.now[:danger] = "編集に失敗しました"
      render :edit
    end
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :email, :image_name, :password, :password_confirmation)
  end
  
  def log_in(user)
    session[:user_id] = user.id
  end
end
