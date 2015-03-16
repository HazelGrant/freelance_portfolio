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

  test "responds to client" do 
    assert_respond_to @piece, :client
  end

  test "responds to start_date" do 
    assert_respond_to @piece, :start_date
  end

  test "responds to end_date" do 
    assert_respond_to @piece, :end_date
  end

  test "responds to description" do 
    assert_respond_to @piece, :description
  end

  test "responds to contributors" do 
    assert_respond_to @piece, :contributors
  end

#  test "responds to documents" do 
#    assert_respond_to @piece, :documents
#  end

end
