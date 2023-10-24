class ApplicationController < ActionController::Base
    include SessionsHelper
    def home
        render html: "Hello, Welcome to my Home Page"
    end
end
