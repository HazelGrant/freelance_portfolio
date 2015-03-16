class Image < ActiveRecord::Base
  belongs_to :portfolio_piece
  
  # User CarrierWave
end
