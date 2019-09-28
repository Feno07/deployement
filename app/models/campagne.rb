class Campagne < ApplicationRecord
  belongs_to :entreprise
  belongs_to :responsable
  has_many :images
  has_many :participers
  has_many	:users, through: :participers
end
