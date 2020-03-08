class PlansController < ApplicationController
  def new
    @plan = Plan.new
    @plan.user_id = session[:user_id]
    @plan.save
    redirect_to new_cost_path
  end
    
  def edit
    set_info
  end
  
  def update
    set_info
    if @plan.update(plan_params)
       @plan.retirement_year = @plan.read_attribute_before_type_cast(:birth_year) + 65
       @plan.save
       redirect_to user_path(session[:user_id]), success: '人生設計を編集しました'
    else
      flash.now[:danger] = '人生設計を編集できませんでした'
      render :edit
    end
  end
  
  private
  def plan_params
    params.require(:plan).permit(
      :marriage,
      :when_marriage,
      :wedding,
      :sons,
      :when_first_son,
      :when_last_son,
      :myhome,
      :when_myhome,
      :birth_year,
      :saving,
      :severance)
  end
end
