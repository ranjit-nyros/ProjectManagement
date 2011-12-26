class HomeController < ApplicationController
layout "home"
def pro_list
@projects=Project.paginate(:page => params[:page], :per_page => 5)
render(:action => 'pro_list')
end
def dev_list
@developers=Developer.paginate(:page => params[:page], :per_page => 5)
render(:action => 'dev_list')
end
def about
@month = (params[:month] || (Time.zone || Time).now.month).to_i
 @year = (params[:year] || (Time.zone || Time).now.year).to_i
day=(params[:day] || (Time.zone || Time).now.day).to_i
   @shown_month = Date.civil(@year, @month,day)
 @date = Date.civil(@year, @month,day)
   @event_strips = Event.event_strips_for_month(@shown_month)

end
def pro_desc
@project=Project.find(params[:id])
render(:action => 'pro_desc')
end
def event_display
@event=Event.find(params[:id])
render :action => 'event_dispaly'
end
def show_users
@users=User.find(:all)
render :action => 'show_users'
end
end
