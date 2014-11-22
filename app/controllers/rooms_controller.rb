class RoomsController < ApplicationController
  include DateConcern

  before_action :load_dates, only: :search
  before_action :set_parameters_in_session, only: :search

  #The enquiry page where room availability can be enquired
  def enquiry
    @rooms = Room.all.group(:type)
  end

  #the search page where the search results are displayed
  def search
    @rooms = Room.available_in_range(@start_date, @end_date).group(:type).presence
  end

  private

    #load start and end date from the params received
    def load_dates
      begin
        @start_date, @end_date = set_dates(params[:start_date],params[:end_date])
        raise 'Date Invalid' if @start_date.nil? || @end_date.nil?
      rescue
        flash.now[:error] = 'Date invalid'
        render action: :search and return nil
      end
    end

    #Save the last searched dates and no. of persons
    def set_parameters_in_session
      [:start_date, :end_date, :persons].each do |parameter|
        session[parameter] = params[parameter]
      end
    end
end
