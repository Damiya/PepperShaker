class ScraperController < ApplicationController
  def scrape
    ScrapeWorker.perform_async(params[:id])
  end

  def cheat
    user = User.find_by_id(params[:id])
    user.confirm!
  end
end
