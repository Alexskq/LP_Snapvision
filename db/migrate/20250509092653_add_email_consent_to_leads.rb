class AddEmailConsentToLeads < ActiveRecord::Migration[7.1]
  def change
    add_column :leads, :email_consent, :boolean, default: false, null: false
  end
end
