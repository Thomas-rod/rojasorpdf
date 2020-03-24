class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def after_sign_in_path_for(resource_or_scope)
    dashboards_path
  end

  def after_sign_out_path_for(resource_or_scope)
    dashboards_path
  end

  private

  def global_donation
    counter = 0
    global_donation_amount = Donation.all.map do |donation|
      counter += donation.amount
    end
    return counter
  end
end
