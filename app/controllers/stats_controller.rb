class StatsController < ApplicationController
  def index
    @stats = Sidekiq::Stats.new
  end
end
