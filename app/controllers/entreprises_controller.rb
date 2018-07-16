class EntreprisesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_entreprise, only: [:edit, :update]
  before_action :require_same_user, :only => [:update]

  def index
    @entreprises = current_user.entreprises
  end

  def new
    @entreprise = current_user.entreprises.build
  end

  def create
    @entreprise = current_user.entreprises.build(entreprise_params)
    @entreprise.owner_id = current_user.id

    if @entreprise.save
      redirect_to listing_entreprise_path, flash[:notice] = "Saved..."
    else
      flash[:alert] = "Something went wrong..."
      render :new
    end
  end

  def listing
    @entreprises = entreprises.where(["owner_id = ?", current_user.id])
  end

  def show

  end

  def update
    if @entreprise.update(entreprise_params)
      flash[:notice] = "Saved..."
    else
      flash[:notice] = "Something went wrong..."
    end
    redirect_back(fallback_location: request.referer)
  end

  private

  # verifie si la personne connectée est celle qui a creee le owner de l'entreprise
  def require_same_user
    # != veut n'est pas egal
    if current_user.id != @entreprise.owner_id
      flash[:danger] = "You don't have permission to do this action."
      redirect_to root_path

    end
  end

  def entreprise_params
    params.require(:entreprise).permit(:name_entreprise, :street_entreprise, :town_entreprise, :zipcode_entreprise, :country_entreprise, :subdmain, :owner_id)
  end

  def set_entreprise
    @entreprise = Entreprise.find(params[:id])
  end
end

