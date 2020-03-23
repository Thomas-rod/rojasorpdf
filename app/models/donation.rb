class Donation < ApplicationRecord
  PLATFORMS = ['helloasso', 'paypal', 'manual']

  belongs_to :donor, dependent: :destroy
  validates :amount, :date, :platform, :donation_number , presence: true
  validates :platform, inclusion: { in: PLATFORMS }
end
