class CreateEntreprises < ActiveRecord::Migration[5.2]
  def change
    create_table :entreprises do |t|
      t.string :name_entreprise, unique: true
      t.string :street_entreprise
      t.string :town_entreprise
      t.string :zipcode_entreprise
      t.string :country_entreprise
      t.string :subdmain, unique:true
      t.integer :owner_id
      t.boolean :active_entrerpise, :default => true
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :entreprises, :subdmain
  end
end
