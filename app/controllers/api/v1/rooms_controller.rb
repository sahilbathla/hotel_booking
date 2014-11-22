class Api::V1::RoomsController < ApplicationController
  include DateConcern

  before_action :authorize, only: :search
  before_action :load_dates, only: :search

  #the search page where the search results are displayed
  # Sample request
  # http://localhost:3000/api/v1/rooms/search?start_date=2014/11/29&end_date=2015/01/02&auth_token=hoteltest123&type=DeluxeRoom
  def search
    @rooms = Room.available_in_range(@start_date, @end_date).by_type(params[:type]).presence
    render json: { rooms: @rooms.as_json }
  end

  private

    def authorize
      #dummy authorization, should be in headers for api
      unless params[:auth_token] == 'hoteltest123'
        render json: { message: 'Not authorized' }, status: 200 and return
      end
    end

    #load start and end date from the params received
    def load_dates
      begin
        @start_date, @end_date = set_dates(params[:start_date], params[:end_date])
        raise 'Date Invalid' if @start_date.nil? || @end_date.nil?
      rescue
        render json: { message: 'Date invalid or empty' }, status: 200 and return
      end
    end
end
