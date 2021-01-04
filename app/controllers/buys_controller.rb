class BuysController < ApplicationController

  def index
    @buys = Buy.all
  end

  def show
    @buys = Buy.all
  end

end
