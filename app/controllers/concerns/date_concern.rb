module DateConcern
  extend ActiveSupport::Concern

  included do
    private
      def set_dates(start_date, end_date)
        start_date = Date.parse(start_date)
        end_date = Date.parse(end_date) 
        if start_date <= end_date && start_date >= Date.current && end_date <= (Date.current + 6.months)
          [start_date, end_date]
        end
      end
  end
end