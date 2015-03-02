require 'test_helper'

class PortfolioPieceTest < ActiveSupport::TestCase

  def setup
    @piece = portfolio_pieces(:valid_piece)
  end

  test "can be created" do 
    piece = PortfolioPiece.new(name: "Confreaks TV")
    assert piece.save
  end

  test "responds to name" do 
    assert_respond_to @piece, :name
  end

end
