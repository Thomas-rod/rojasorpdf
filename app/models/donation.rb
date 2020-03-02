class Donation < ApplicationRecord
  belongs_to :donor
  validates :amount, presence: true
end
