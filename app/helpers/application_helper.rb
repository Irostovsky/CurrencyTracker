module ApplicationHelper
  def sign_in_link
    if user_signed_in? 
      link_to "Sign out", destroy_user_session_path
    else  
      link_to("Sign in", new_user_session_path) << " or " << link_to("Register", new_user_registration_path) 
    end  
  end
end
