class ApplicationController < ActionController::Base
    include SessionsHelper

    def logged_in_user
      unless logged_in?
          store_location
          flash[:danger] = "Please you must login first to visit this page"
          redirect_to login_url
      end
    end

    def home
        render html: "Hello, Welcome to my Home Page"
    end
end
