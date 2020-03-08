class RemoveMarriage2FromPlans < ActiveRecord::Migration[5.2]
  def change
    remove_column :plans, :user_id,         :integer
    remove_column :plans, :marriage,        :integer
    remove_column :plans, :when_marriage,   :integer
    remove_column :plans, :wedding,         :integer
    remove_column :plans, :sons,            :integer
    remove_column :plans, :when_first_son,  :integer
    remove_column :plans, :when_last_son,   :integer
    remove_column :plans, :myhome,          :integer
    remove_column :plans, :when_myhome,     :integer
    remove_column :plans, :birth_year,      :integer
    remove_column :plans, :retirement_year, :integer
    remove_column :plans, :saving,          :integer
    remove_column :plans, :severance,       :integer
  end
end
