class ApplicationController < ActionController::Base
  rescue_from Apartment::TenantExists, with: :redirect_to_root_path

  protected

  def redirect_to_root_path
    Rails.logger.error "ERROR: Apartment Tenant"
    Apartment::Tenant.switch!(params[:id])
    flash[:alert] = "Tenant exists...#{Apartment::Tenant.current}"
   # Apartment::Tenant.reset
    redirect_to root_path
   # redirect_to entreprise_path(enterprise_id: params[:entreprise])
  end


end
