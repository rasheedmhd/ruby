class ApplicationController < ActionController::Base
    def home
        render html: "Hello, Welcome to my Home Page"
    end
end
