class ApplicationController < ActionController::Base
  rescue_from Apartment::TenantExists, with: :redirect_to_root_path

  protected

  def redirect_to_root_path
    Rails.logger.error "ERROR: Apartment Tenant"
    Apartment::Tenant.reset
    redirect_to root_path
  end


end
