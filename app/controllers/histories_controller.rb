class HistoriesController < ApplicationController
  def index
    @histories = current_user.histories
  end
end
