class AddUserIdToCosts < ActiveRecord::Migration[5.2]
  def change
    add_column :costs, :user_id,       :integer
    add_column :costs, :edu_cost,      :integer, default: 0
    add_column :costs, :old_cost,      :integer, default: 0
    add_column :costs, :target,        :integer, default: 0
    add_column :costs, :others,        :integer, default: 0
    add_column :costs, :marriage_cost, :integer, default: 0
    add_column :costs, :myhome_cost,   :integer, default: 0
  end
end
