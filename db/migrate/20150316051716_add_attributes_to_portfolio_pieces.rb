class AddAttributesToPortfolioPieces < ActiveRecord::Migration
  def change
    add_column :portfolio_pieces, :client, :string
    add_column :portfolio_pieces, :start_date, :datetime
    add_column :portfolio_pieces, :end_date, :datetime
    add_column :portfolio_pieces, :description, :text
  end
end
