class ConferencesController < ApplicationController

  def index
    @events = Event.order(:starts_on).includes(:conference)
  end

end