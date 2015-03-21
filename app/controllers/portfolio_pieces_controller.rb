class PortfolioPiecesController < ApplicationController
  before_filter :authenticate_user!, except: [:show, :index]
  before_action :set_piece, only: [:show, :edit, :update, :destroy]

  def index
    @portfolio_pieces = PortfolioPiece.page params[:page]
  end

  def show
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

  def edit
  end

  def update
    if @portfolio_piece.update_attributes(portfolio_piece_params)
      flash[:notice] = "Piece saved."
      redirect_to @portfolio_piece
    else
      flash[:alert] = "Could not save piece."
      render 'edit'
    end
  end

  def destroy
    @portfolio_piece.destroy
    flash[:notice] = "Portfolio piece destroyed."
    redirect_to '/portfolio'
  end

  private

  def portfolio_piece_params
    params.require(:portfolio_piece).permit(:name, :client, :description)
  end

  def set_piece
    @portfolio_piece = PortfolioPiece.find(params[:id])
  end
end
