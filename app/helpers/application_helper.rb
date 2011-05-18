module ApplicationHelper
  def sign_in_link
    if user_signed_in? 
      link_to "Sign out", destroy_user_session_path
    else  
      link_to("Sign in", new_user_session_path) << " or " << link_to("Register", new_user_registration_path) 
    end  
  end
  
  def e params
    escape_javascript params
  end
  
  def country_progress_chart
    data = current_user.user_countries.group_by(&:created_day)
    x_data = data.keys.join("|")
    y_data = data.values.map{|i| i.size}.inject([]){|res, i| res << i + res.last.to_i; res }.join(",")
    image_tag("https://chart.googleapis.com/chart?cht=lc&chs=400x200&chd=t:#{y_data}&chxt=x,y&chxl=0:|#{x_data}|", :alt => "chart")
  end
end
