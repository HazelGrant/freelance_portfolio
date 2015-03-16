class PortfolioPiece < ActiveRecord::Base
  validates :name, presence: true

  paginates_per 6
end
