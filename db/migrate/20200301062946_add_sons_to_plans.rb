class AddSonsToPlans < ActiveRecord::Migration[5.2]
  def change
    add_column :plans, :user_id,         :integer
    add_column :plans, :marriage,        :integer, default: 9999
    add_column :plans, :when_marriage,   :integer, default: 9999
    add_column :plans, :wedding,         :integer, default: 9999
    add_column :plans, :sons,            :integer, default: 9999
    add_column :plans, :when_first_son,  :integer, default: 9999
    add_column :plans, :when_last_son,   :integer, default: 9999
    add_column :plans, :myhome,          :integer, default: 9999
    add_column :plans, :when_myhome,     :integer, default: 9999
    add_column :plans, :birth_year,      :integer, default: 9999
    add_column :plans, :retirement_year, :integer, default: 9999
    add_column :plans, :saving,          :integer, default: 0
    add_column :plans, :severance,       :integer, default: 0
  end
end
