require 'rails_helper'

feature "Entreprises" do
  scenario "creating entreprise" do
    visit new_entreprise_path

    # user1 = create(:entreprise)
    fill_in "name_entreprise", with: "tree"
    fill_in "subdmain", with: "tree"
    click_link "Create entreprise"
    within(".flash_notice") do
      succes_message = "Saved..."
      expected(page).to have_content(success_message)
    end
  end
end