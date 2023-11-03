class MicropostsController < ApplicationController
  before_action :logged_in_user, only: %i[create destroy]
  before_action :correct_user,   only: :destroy

  def create
    print "before build \n"
    @micropost = current_user.microposts.create(micropost_permitted_params)
    @micropost.image.attach(params[:micropost][:image])
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

  def destroy
    # @micropost = current_user.microposts.find(params[:id])
    @micropost.destroy
    flash[:success] = 'micropost successfully deleted'
    redirect_to request.referrer || root_url
  end

  private

  def micropost_permitted_params
    params.require(:micropost).permit(:content, :image)
  end

  def correct_user
    @micropost = current_user.microposts.find_by(id: params[:id])
    redirect_to root_url if @micropost.nil?
  end
end
