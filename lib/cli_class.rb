require 'pry'
class FwcpStockTracker::CLI

  def call
    greeting
    list_stocks
    menu
    goodbye
  end

  def greeting
    puts "Welcome to the FWCP Fund Tracker!"
    puts "Enter the Symbol of the Fund you'd like more info about or type list to see the funds agian or exit:"
  end

  def list_stocks
    puts "Today's Quotes Are:"
    @fund = FwcpStockTracker::Fund.today
    @fund.each do |fund|
      puts "1. #{fund.name} - #{fund.ticker}"
    end
  end

  def menu
    input = nil
    while input != "exit"
      input = gets.strip.downcase
      if input == "tslf"
        puts "#{@fund[0].name} - #{@fund[0].ticker}(NAV: #{@fund[0].nav_ticker}) - Price: #{@fund[0].price}, NAV: #{@fund[0].nav}"
      elsif input == "egif"
        puts "#{@fund[1].name} - #{@fund[1].ticker}(NAV: #{@fund[1].nav_ticker}) - Price: #{@fund[1].price}, NAV: #{@fund[1].nav}"
      elsif input == "list"
        @fund.each do |fund|
          puts "#{fund.name} - #{fund.ticker}(NAV: #{fund.nav_ticker}) - Price: #{fund.price}, NAV: #{fund.nav}"
        end
      else
        "Plese type list, exit, EGIF, or TSLF"
      end
    end
  end

  def goodbye
    puts "See you tomorrow for more quotes!"
  end
end
