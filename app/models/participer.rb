class Participer < ApplicationRecord
  belongs_to :user
  belongs_to :campagne
end
