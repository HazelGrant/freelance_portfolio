class AddUrlToPortfolioPieces < ActiveRecord::Migration
  def change
    add_column :portfolio_pieces, :url, :string
  end
end
