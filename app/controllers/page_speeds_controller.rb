class PageSpeedsController < ApplicationController
  def new
  end

  def insight
    @url = params[:url]
    tem_url = "https://www.googleapis.com/pagespeedonline/v2/runPagespeed?url=#{@url}&strategy=mobile&key=AIzaSyD_ll9zEBq3kWwINoWbwyKsDgTERrBLz_g&locale=zh_CN"
    tem_uri = URI(tem_url)
    response = Net::HTTP.get(tem_uri)
    @result = JSON.parse(response)
  end
end
