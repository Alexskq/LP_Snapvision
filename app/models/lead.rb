class Lead < ApplicationRecord
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :lead_type, presence: true, inclusion: { in: [ "startup", "developer" ] }
end
