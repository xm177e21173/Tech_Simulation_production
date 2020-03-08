# class Calc < ApplicationController
#   def initialize(user_id)
#     @plan = Plan.find_by(user_id: user_id)
#     @cost = Cost.find_by(user_id: user_id)
#     @graph_upper = 0
#     @graph_params = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
#     @total_params = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
#     @ave_params = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
#   end
  
#   def calc_graph_params
#     calc_edu_cost
#     calc_old_cost
#     calc_myhome_cost
#     calc_marriage_cost
#     return @graph_params
#   end
  
#   def calc_total_params
#     calc_total_cost
#     return @total_params
#   end
  
#   def calc_ave_params
#     calc_ave_cost
#     return @ave_params
#   end
  
#   # 教育費の割り振り
#   def calc_edu_cost
#     # i：第一子誕生から末子大学卒業までの期間
#     i = @plan.read_attribute_before_type_cast(:when_last_son) - @plan.read_attribute_before_type_cast(:when_first_son) + 6
#     # 教育費iで割り戻した値を教育費の平均値とする
#     single_edu_cost = @cost.edu_cost / i
#     j = @plan.read_attribute_before_type_cast(:when_first_son)
#     # 65際までに末子が大学卒業する場合の処理
#     if @plan.read_attribute_before_type_cast(:when_first_son) <= 4
#       i.times do
#         @graph_params[j] += single_edu_cost
#         j += 1
#       end
#     # 65歳までに末子が大学卒業しない場合の処理
#     else
#       # m：定年してから末子が大学卒業するまでの期間
#       m = @plan.read_attribute_before_type_cast(:when_last_son) - 4
#       n = i - m
#       n.times do
#         @graph_params[j]
#         j += 1
#       end
#       # 定年後にかかる教育費を加算
#       @graph_params[9] += single_edu_cost * m
#     end
#   end
  
#   # 老後の生活資金の割り振り
#   def calc_old_cost
#     @graph_params[9] += @cost.old_cost
#   end
  
#   # 住宅購入費の割り振り
#   def calc_myhome_cost
#     # 35年でローンを完済する前提で、５年あたりの負担費用を計算
#     single_myhome_cost = @cost.myhome_cost / 7
#     i = @plan.read_attribute_before_type_cast(:when_myhome)
    
#     # 65歳までにローン完済する場合の処理
#     if @plan.read_attribute_before_type_cast(:when_myhome) <= 3
#       7.times do
#         @graph_params[i] += single_myhome_cost
#         i += 1
#       end
      
#     # 65歳までにローンを完済しない場合の処理
#     else
#       j = i - 3
#       m = 8 - i
#       m.times do
#         @graph_params[j] += single_myhome_cost
#         j += 1
#       end
#       # 定年後にかかる費用を加算
#       @graph_params[9] += single_myhome_cost * j
#     end
#   end
  
#   def calc_marriage_cost
#     i = @plan.read_attribute_before_type_cast(:when_marriage)
#     @graph_params[i] += @cost.marriage_cost
# 　end
  
#   def calc_total_cost
#     @total_params[0] = @graph_params[0]
#     i = 1
#     j = 0
#     8.times do
#       @total_params[i] = @total_params[j] + @graph_params[i]
#       i += 1
#       j += 1
#     end
#     # 退職金を減産
#     @total_params[9] -= @plan.severance
#   end
# 　def calc_ave_cost
#     total_target = @cost.target - @plan.saving - @plan.severance
#     single_target = total_target / 9
#     i = 0
#     j = 1
#     9.times do
#       @ave_params[i] = single_target * j
#       i += 1
#       j += 1
#     end
#   end
# end