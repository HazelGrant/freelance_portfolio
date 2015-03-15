class PortfolioPiecesController < ApplicationController
  before_filter :authenticate_user!, only: [:new, :create]

  def index
  end

  def show
    @portfolio_piece = PortfolioPiece.find(params[:id])
  end

  def new
    @portfolio_piece = PortfolioPiece.new
  end

  def create
    @portfolio_piece = PortfolioPiece.new(portfolio_piece_params)

    if @portfolio_piece.save
      flash[:notice] = "Successfully created Portfolio Piece."
      redirect_to portfolio_piece_path(@portfolio_piece)
    else
      flash[:alert] = "Did not save Portfolio Piece."
      render 'new'
    end
  end

  private

  def portfolio_piece_params
    params.require(:portfolio_piece).permit(:name)
  end

end
