class PortfolioContribution < ActiveRecord::Base
  belongs_to :contributor
  belongs_to :portfolio_piece
end
