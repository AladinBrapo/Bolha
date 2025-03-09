# All Administrate controllers inherit from this
# `Administrate::ApplicationController`, making it the ideal place to put
# authentication logic or other before_actions.
#
# If you want to add pagination or other controller-level concerns,
# you're free to overwrite the RESTful controller actions.
module Admin
  class Admin::ApplicationController < ApplicationController
    before_action :authorize_admin!
  
    private
  
    def authorize_admin!
      unless current_user&.admin?
        redirect_to root_path, alert: "Access denied."
      end
    end
  end  
end

