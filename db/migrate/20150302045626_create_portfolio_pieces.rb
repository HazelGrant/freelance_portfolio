class CreatePortfolioPieces < ActiveRecord::Migration
  def change
    create_table :portfolio_pieces do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
