class RemoveEduCostFromCosts < ActiveRecord::Migration[5.2]
  def change
    remove_column :costs, :user_id, :integer
    remove_column :costs, :edu_cost, :integer
    remove_column :costs, :old_cost, :integer
    remove_column :costs, :target, :integer
    remove_column :costs, :others, :integer
    remove_column :costs, :marriage_cost, :integer
    remove_column :costs, :myhome_cost, :integer
  end
end
