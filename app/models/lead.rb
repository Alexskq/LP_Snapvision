class Lead < ApplicationRecord
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :lead_type, presence: true, inclusion: { in: [ "startup", "developer" ] }
  validates :email_consent, acceptance: true, if: -> { email.present? }

  # Valider les champs startup seulement si lead_type est "startup"
  with_options if: -> { lead_type == "startup" } do
    validates :project_name, length: { maximum: 255 }, allow_blank: true
    validates :pitch, length: { maximum: 255 }, allow_blank: true
    validates :problem, length: { maximum: 1000 }, allow_blank: true
    validates :mvp_objective, length: { maximum: 255 }, allow_blank: true
    validates :deadline, length: { maximum: 255 }, allow_blank: true
  end

  # Valider les champs developer seulement si lead_type est "developer"
  with_options if: -> { lead_type == "developer" } do
    validates :stack, length: { maximum: 255 }, allow_blank: true
    validates :experience_level, length: { maximum: 255 }, allow_blank: true
    validates :portfolio, length: { maximum: 255 }, allow_blank: true
    validates :mission_type, length: { maximum: 255 }, allow_blank: true
    validates :availability, length: { maximum: 255 }, allow_blank: true
  end
end
