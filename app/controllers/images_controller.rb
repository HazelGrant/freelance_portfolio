class ImagesController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]
  before_action :set_portfolio_piece
  before_action :set_image, only: [:show, :edit, :update]

  def index
    @images = @portfolio_piece.images.page params[:page]
  end

  def show
  end

  def new
    @image = @portfolio_piece.images.new
  end

  def create
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
  end

  def update
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

  def set_portfolio_piece
    @portfolio_piece = PortfolioPiece.find(params[:portfolio_piece_id])
  end

  def set_image
    @image = @portfolio_piece.images.find(params[:id])
  end
end
