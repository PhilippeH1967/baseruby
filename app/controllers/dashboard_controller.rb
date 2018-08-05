class DashboardController < ApplicationController
  def index
    @entreprise = Entreprise.find_by(name_entreprise: params[:entreprise_name])
  end
end
