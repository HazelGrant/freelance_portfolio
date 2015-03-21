class RemoveDatesFromPortfolioPieces < ActiveRecord::Migration
  def change
    remove_column :portfolio_pieces, :start_date, :datetime
    remove_column :portfolio_pieces, :end_date, :datetime
  end
end
