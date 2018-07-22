class ConfirmationsController < Devise::ConfirmationsController
  private
  def after_confirmation_path_for(resource_name, resource)
    #link_to 'layouts/confirmed'
    layouts_confirmed_path
  end
end