class AddDetailsToLeads < ActiveRecord::Migration[8.0]
  def change
    add_column :leads, :project_name, :string
    add_column :leads, :pitch, :string
    add_column :leads, :problem, :string
    add_column :leads, :mvp_objective, :string
    add_column :leads, :deadline, :string
    add_column :leads, :stack, :string
    add_column :leads, :experience_level, :string
    add_column :leads, :portfolio, :string
    add_column :leads, :mission_type, :string
    add_column :leads, :availability, :string
  end
end
