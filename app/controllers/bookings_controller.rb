class BookingsController < ApplicationController
  include DateConcern

  before_action :check_user, only: :create

  #To create a booking
  def create
    @booking = current_user.bookings.build(create_params)
    if @booking.save
      flash[:notice] = 'Booking successful'
    else
      flash[:alert] = 'Booking failed'
    end
    redirect_to booking_path(@booking)
  end

  #Show booking
  def show
    # we can check for current_user(like in index) here as well 
    # but I have used it in view just to demonstrate
    @booking = Booking.includes(:user, :room).find_by(id: params[:id])
    @room = @booking.room
    @user = @booking.user
  end

  #Show user's bookings
  def index
    @bookings = current_user.bookings.includes(:room)
  end

  private
    def check_user
      unless user_signed_in?
        flash[:alert] = 'Please log in to book'
        session[:referer] = request.referer
        redirect_to new_user_session_path
      end
    end

    def create_params
      params.permit(:room_id, :persons, :start_date, :end_date)
    end
end
