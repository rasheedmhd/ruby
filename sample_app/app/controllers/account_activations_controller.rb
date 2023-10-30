class AccountActivationsController < ApplicationController
    def edit
        user = User.find_by(email: params[:email])
        if user && !user.activate && user.authenticated?(:activation, params[:id])
            user.activate
            log_in user
            flash[:success] = "User successfully activated"
            redirect_to user
        else
            flash[:danger] = "Invalid activation token"
            redirect_to root_url
        end
    end
end
