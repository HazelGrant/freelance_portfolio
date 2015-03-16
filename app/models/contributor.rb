class Contributor < ActiveRecord::Base
  has_many :portfolio_contributions
  has_many :portfolio_pieces, :through => :portfolio_contributions
end
