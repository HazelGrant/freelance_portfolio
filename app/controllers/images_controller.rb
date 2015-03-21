class ImagesController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]

  def index
  end

  def show
  end

  def new
    @portfolio_piece = PortfolioPiece.find(params[:portfolio_piece_id])
    @image = @portfolio_piece.images.new
  end

  def create
    @portfolio_piece = PortfolioPiece.find(params[:portfolio_piece_id])
    @image = @portfolio_piece.images.new(image_params)

    if @image.save
      flash[:notice] = "Image saved."
      redirect_to portfolio_piece_image_path(portfolio_piece_id: @portfolio_piece, id: @image)
    else
      flash[:alert] = "Image could not be saved."
      render 'new'
    end
  end

  def edit
    @portfolio_piece = PortfolioPiece.find(params[:portfolio_piece_id])
    @image = @portfolio_piece.images.find(params[:id])
  end

  def update
    @portfolio_piece = PortfolioPiece.find(params[:portfolio_piece_id])
    @image = @portfolio_piece.images.find(params[:id])

    if @image.update_attributes(image_params)
      flash[:notice] = "Image saved."
      redirect_to portfolio_piece_image_path(portfolio_piece_id: @portfolio_piece, id: @image)
    else
      flash[:alert] = "Image could not be saved."
      render 'edit'
    end
  end

  private

  def image_params
    params.require(:image).permit(:portfolio_piece_id, :photo, :description)
  end
end
