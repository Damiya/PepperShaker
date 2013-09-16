class ScraperController < ApplicationController
  def scrape
    ScrapeWorker.perform_async(params[:id])
  end
end
