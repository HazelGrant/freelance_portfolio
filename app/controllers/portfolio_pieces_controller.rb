class PortfolioPiecesController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]

  def index
  end

  def show
  end

end
