class StaticPagesController < ApplicationController
  def home
      # render html: "StaticPages #HOME"
      @micropost = current_user.microposts.build if logged_in?
  end

  def help
      # render html: "StaticPages #HELP"
  end

  def about
  end
end
