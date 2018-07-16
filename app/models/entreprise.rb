# == Schema Information
#
# Table name: entreprises
#
#  id                     :integer          not null, primary key
#  name                   :string           default(""), not null, unique
#  address                :string
#  town                   :string
#  state                  :string
#  country                :string
#  zipcode                :string
#  active                 :boolean
#  subdomain              :string           default(""), not null, unique
#  owner_id               :integer          default(""), not null


class Entreprise < ApplicationRecord

  RESTRICTED_SUBDOMAINS = %w(www)

  belongs_to :user

  validates :name_entreprise, presence: true, length: {maximum: 50}, uniqueness: { case_sensitive: false},
            format: { with: /\A[\w\-]+\Z/i, message: 'contains invalid characters'}

  validates :subdmain,
            uniqueness: { case_sensitive: false},
            format: { with: /\A[\w\-]+\Z/i, allow_blank: true, message: 'contains invalid characters'},
            exclusion: { in: RESTRICTED_SUBDOMAINS, message: 'restricted'}

  before_validation :downcase_subdomain

  before_validation :downcase_name

  private

  def downcase_name
    self.name_entreprise = name_entreprise.try(:downcase)
  end

  def downcase_subdomain
    self.subdmain = subdmain.try(:downcase)
  end

end
