require 'open-uri'

class FwcpStockTracker::Fund
attr_accessor :name, :ticker, :nav_ticker, :price, :nav

  def self.today
    self.fund_scraper
  end

  def self.fund_scraper
    funds = []
    funds << self.scrape_tslf
    funds << self.scrape_egif
    funds
  end

  def self.scrape_tslf
    doc = Nokogiri::HTML(open("http://www.cefconnect.com/fund/TSLF"))
    fund = self.new
    fund.name = "The THL Credit Senior Loan Fund"
    fund.ticker = "TSLF"
    fund.nav_ticker = "XTSLX"
    fund.price = doc.css("td.right-align")[0].text
    fund.nav = doc.css("td.right-align")[1].text
    fund
  end

  def self.scrape_egif
    doc = Nokogiri::HTML(open("http://www.cefconnect.com/fund/EGIF"))
    fund = self.new
    fund.name = "The Eagle Growth and Income Opportunity Fund"
    fund.ticker = "EGIF"
    fund.nav_ticker = "XEGIX"
    fund.price = doc.css("td.right-align")[0].text
    fund.nav = doc.css("td.right-align")[1].text
    fund
  end

end
