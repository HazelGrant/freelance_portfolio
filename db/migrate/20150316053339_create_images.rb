class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.integer :portfolio_piece_id
      t.string :url

      t.timestamps null: false
    end
  end
end
