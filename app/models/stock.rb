class Stock < ApplicationRecord
	
  has_many :user_stocks
  has_many :users, through: :user_stocks
	
  def self.find_by_ticker(ticker_symbol)
		where(ticker: ticker_symbol).first
	end
  
  def self.new_from_lookup(ticker_symbol)
  	stock = StockQuote::Stock.quote(ticker_symbol)
  	return nil unless stock.name 
  	new_stock = new(ticker: stock.symbol, name: stock.name)
  	new_stock.last_price = new_stock.price
  	new_stock
  end

  def price
  	closing = StockQuote::Stock.quote(ticker).close
  	return "#{closing} (closing)" if closing

  	opening = StockQuote::Stock.quote(ticker).open
  	return "#{opening} (opening)" if opening

    "Unavailable"
   end

end
