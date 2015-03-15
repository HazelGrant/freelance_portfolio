class StaticPagesController < ApplicationController
  before_filter :authenticate_user!, only: [:about]

  def home
  end

  def about
  end

end
