class CreatePortfolioContributions < ActiveRecord::Migration
  def change
    create_table :portfolio_contributions do |t|
      t.integer :contributor_id
      t.integer :portfolio_piece_id

      t.timestamps
    end
  end
end
