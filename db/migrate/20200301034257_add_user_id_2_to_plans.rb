class AddUserId2ToPlans < ActiveRecord::Migration[5.2]
  def change
    add_column :plans, :user_id,         :integer
    add_column :plans, :marriage,        :integer
    add_column :plans, :when_marriage,   :integer
    add_column :plans, :wedding,         :integer
    add_column :plans, :sons,            :integer
    add_column :plans, :when_first_son,  :integer
    add_column :plans, :when_last_son,   :integer
    add_column :plans, :myhome,          :integer
    add_column :plans, :when_myhome,     :integer
    add_column :plans, :birth_year,      :integer
    add_column :plans, :retirement_year, :integer
    add_column :plans, :saving,          :integer
    add_column :plans, :severance,       :integer
  end
end
