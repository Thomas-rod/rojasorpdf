class Donor < ApplicationRecord
  has_many :donations
  validates :first_name, :last_name, :address, :zip_code, :city, :email, presence: true
end
