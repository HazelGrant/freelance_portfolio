class PortfolioPiece < ActiveRecord::Base
  has_many :portfolio_contributions
  has_many :contributors, :through => :portfolio_contributions
  validates :name, presence: true

  paginates_per 6
end
