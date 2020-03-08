class RemoveMarriageFromPlans < ActiveRecord::Migration[5.2]
  def change
    remove_column :plans, :marriage, :string
    remove_column :plans, :sons, :integer
    remove_column :plans, :birth, :integer
    remove_column :plans, :user_id, :integer
    remove_column :plans, :retirement, :integer
    remove_column :plans, :severance, :integer
    remove_column :plans, :when_marriage, :integer
    remove_column :plans, :wedding, :string
    remove_column :plans, :first_son, :integer
    remove_column :plans, :last_son, :integer
    remove_column :plans, :myhome, :string
    remove_column :plans, :when_myhome
    remove_column :plans, :saving, :integer
  end
end
