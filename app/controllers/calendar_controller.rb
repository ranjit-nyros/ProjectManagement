class CalendarController < ApplicationController
  
  def index
  @month = (params[:month] || (Time.zone || Time).now.month).to_i
 @year = (params[:year] || (Time.zone || Time).now.year).to_i
day=(params[:day] || (Time.zone || Time).now.day).to_i
   @shown_month = Date.civil(@year, @month,day)
 @date = Date.civil(@year, @month,day)
   @event_strips = Event.event_strips_for_month(@shown_month)

  end
  
end
