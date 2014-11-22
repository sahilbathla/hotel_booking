class HotelController < ApplicationController
  before_action :redirect_to_saved_state, only: :show

  def show;end

  private
    def redirect_to_saved_state
      saved_state = session[:referer]
      if saved_state
        session[:referer] = nil
        redirect_to saved_state
      end
    end
end
