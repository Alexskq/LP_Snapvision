class Admin::LeadsController < ApplicationController
  before_action :authenticate_user!

  def index
    @startup_leads = Lead.where(lead_type: "startup").order(created_at: :desc)
    @developer_leads = Lead.where(lead_type: "developer").order(created_at: :desc)
  end
end
