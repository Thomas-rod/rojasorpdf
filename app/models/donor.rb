class Donor < ApplicationRecord
  STATUS_DONOR = ['donateur', 'adherent']
  has_many :donations
  validates :first_name, :last_name, :address, :zip_code, :city, :email, :status, presence: true
  validates :email, uniqueness: true
  validates :status, inclusion: { in: STATUS_DONOR }
end
