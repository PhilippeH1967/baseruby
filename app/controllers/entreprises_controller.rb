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
      flash[:notice] = "Saved..."
      redirect_to action: :listing
    else
      flash[:alert] = "Something went wrong...#{@entreprise.errors.full_messages.join('. ')}"
      render :new
    end
  end

  def listing
    @entreprises = Entreprise.where(:owner_id => current_user.id)
  end
 def show
   @entreprises = current_user.entreprises
 end

  def update
    if @entreprise.update(entreprise_params)
    flash[:notice] = "Saved..."
    else
      flash[:alert] = "Something went wrong...#{@entreprise.errors.full_messages.join('. ')}"
    end
    redirect_back(fallback_location: request.referer)
  end

  def hide_case
    @case = Entreprise.find(params[:id])
    @case.update(active_entrerpise: true)
    redirect_to action: :listing
  end

  def unhide_case
    @case = Entreprise.find(params[:id])
    @case.update(active_entrerpise: false)
    redirect_to action: :listing
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

