class Donation < ApplicationRecord
  belongs_to :donor
  validates :amout, presence: true
  validates :amout, as
end
