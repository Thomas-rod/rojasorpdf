class Donation < ApplicationRecord
  belongs_to :donor, dependent: :destroy
  validates :amount, presence: true
end
