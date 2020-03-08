class User < ApplicationRecord
  validates :name, presence: true
  
  validates :email, presence:   true
  validates :email, uniqueness: true
  validates :email, format:     { with: /\A.+@.+\..+\z/}
  
  validates :password, length: { in: 8..32 }
  validates :password, format: { with: /\A(?=.*?[a-zA-Z])[a-zA-Z\d]*\z/ }
  validates :password, format: { with: /\A(?=.*?[\d])[a-zA-Z\d]*\z/ }
  
  has_secure_password
  mount_uploader :image_name, ImageUploader
  
  def cal_target
    @plan = Plan.find_by(user_id: self.id)
    @cost = Cost.find_by(user_id: self.id)
    @today = Date.today
    @worktime = @plan.retirement_year - @today.year
    @to_earn = @cost.target - @plan.saving - @plan.severance
    @per_year = @to_earn / @worktime
    return @per_year
  end
  
  def graph_upper
    @plan = Plan.find_by(user_id: self.id)
    @cost = Cost.find_by(user_id: self.id)
    @to_save_target = @cost.target - @plan.severance
    @graph_upper = @to_save_target / 1000 + 1
    return @graph_upper
  end
  
  def calc_simu_params
    @plan = Plan.find_by(user_id: self.id)
    @cost = Cost.find_by(user_id: self.id)
    @graph_params = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    @total_params = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    @ave_params = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    calc_marriage_cost
    calc_edu_cost
    calc_old_cost
    calc_myhome_cost
    calc_total_cost
    calc_ave_cost
    @simu_params = [@graph_params, @total_params, @ave_params]
    return @simu_params
  end
  
  def calc_marriage_cost
    i = @plan.read_attribute_before_type_cast(:when_marriage) / 10
    @graph_params[i] = @cost.marriage_cost
  end
  
  # 教育費の割り振り
  def calc_edu_cost
    # i：第一子誕生から末子大学卒業までの期間
    i = @plan.read_attribute_before_type_cast(:when_last_son) / 10 - @plan.read_attribute_before_type_cast(:when_first_son) / 10 + 6
    # 教育費iで割り戻した値を教育費の平均値とする
    single_edu_cost = @cost.edu_cost / i
    j = @plan.read_attribute_before_type_cast(:when_first_son) / 10
    # 65際までに末子が大学卒業する場合の処理
    if @plan.read_attribute_before_type_cast(:when_first_son) / 10 <= 4
      i.times do
        @graph_params[j] = @graph_params[j] + single_edu_cost
        j += 1
      end
    # 65歳までに末子が大学卒業しない場合の処理
    else
      # m：定年してから末子が大学卒業するまでの期間
      m = @plan.read_attribute_before_type_cast(:when_last_son) / 10 - 4
      n = i - m
      n.times do
        @graph_params[j]
        j += 1
      end
      # 定年後にかかる教育費を加算
      @graph_params[9] += single_edu_cost * m
    end
  end
  
  # 老後の生活資金の割り振り
  def calc_old_cost
    @graph_params[9] += @plan.severance - @cost.old_cost
  end
  
  # 住宅購入費の割り振り
  def calc_myhome_cost
    # 35年でローンを完済する前提で、５年あたりの負担費用を計算
    single_myhome_cost = @cost.myhome_cost / 7
    i = @plan.read_attribute_before_type_cast(:when_myhome) / 10
    # 65歳までにローン完済する場合の処理
    if @plan.read_attribute_before_type_cast(:when_myhome) / 10 <= 3
      7.times do
        @graph_params[i] += single_myhome_cost
        i += 1
      end
      # 65歳までにローンを完済しない場合の処理
    else
      j = i - 3
      m = 8 - i
      m.times do
        @graph_params[j] += single_myhome_cost
        j += 1
      end
      # 定年後にかかる費用を加算
      @graph_params[9] += single_myhome_cost * j
    end
  end

  def calc_total_cost
    @total_params[0] = @graph_params[0]
    i = 1
    j = 0
    9.times do
      @total_params[i] = @total_params[j] + @graph_params[i]
      i += 1
      j += 1
    end
  end

  def calc_ave_cost
    total_target = @cost.target - @plan.saving - @plan.severance
    @ave_params[0] += @plan.saving
    single_target = total_target / 9
    i = 0
    j = 1
    10.times do
      @ave_params[i] = single_target * j
      i += 1
      j += 1
    end
  end
end
