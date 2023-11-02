class MicropostsController < ApplicationController
  before_action :logged_in_user, only: %i[create destroy]

  def create
    print "before build \n"
    @micropost = current_user.microposts.create(micropost_permitted_params)
    print "return micro post before saving.\n content: #{@micropost.content} \n"
    if @micropost.save
      print "micro post saved to db.\n"
      flash[:success] = 'Micropost created successfully'
      redirect_to root_url
    else
      print "user failed to get saved.\n"
      @feed_items = current_user.feed.paginate(page: params[:page])
      flash[:danger] = 'Invalid post'
      redirect_to root_url
    end
  end

  def destroy; end

  private

  def micropost_permitted_params
    params.require(:micropost).permit(:content)
  end
end
