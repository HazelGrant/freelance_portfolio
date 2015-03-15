class PortfolioPiece < ActiveRecord::Base
  validates :name, presence: true
end
