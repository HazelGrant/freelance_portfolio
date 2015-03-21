class AddPrimaryTechnologyToPortfolioPieces < ActiveRecord::Migration
  def change
    add_column :portfolio_pieces, :primary_technology, :string
  end
end
