class LeadsController < ApplicationController
  def create
    @lead = Lead.new(lead_params)

    respond_to do |format|
      if @lead.save
        format.json { render json: { success: true, message: "Merci pour votre intérêt!" }, status: :created }
        format.html { redirect_back fallback_location: root_path, notice: "Merci pour votre intérêt!" }
      else
        format.json { render json: { success: false, errors: @lead.errors.full_messages }, status: :unprocessable_entity }
        format.html { redirect_back fallback_location: root_path, alert: @lead.errors.full_messages.join(", ") }
      end
    end
  end

  private

  def lead_params
    params.require(:lead).permit(:email, :lead_type)
  end
end
