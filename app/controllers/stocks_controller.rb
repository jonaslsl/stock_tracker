class StocksController < ApplicationController
  def search
  	if params[:stock]
  		@stock = Stock.find_by_ticker(params[:stock])
  		@stock ||= Stock.new_from_lookup(params[:stock])
  		if @stock 
  			# render json: @stock
  			render partial: 'lookup'
  		end
  	else
  		render status: :not_found, nothing: true
  	end
  end
end