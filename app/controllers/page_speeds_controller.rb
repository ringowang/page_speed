class PageSpeedsController < ApplicationController
  def new
  end

  def insight
    @url = params[:url]
    # 保存历史记录
    if current_user && History.where(url: @url).blank?
      @history = History.new(url: @url, user_id: current_user.id)
      render :new unless @history.save
    end
    # 这里不应该暴露API key，现在暂且这样处理
    tem_url = "https://www.googleapis.com/pagespeedonline/v2/runPagespeed?url=#{@url}&strategy=mobile&key=AIzaSyD_ll9zEBq3kWwINoWbwyKsDgTERrBLz_g&locale=zh_CN"
    tem_uri = URI(tem_url)
    response = Net::HTTP.get(tem_uri)
    @result = JSON.parse(response)
  end
end
