class MicropostsController < ApplicationController
    before_action :logged_in_user,    only: [:create, :destroy]

    def create
        print "before build \n"
        @micropost = current_user.microposts.create(micropost_permitted_params)
        print "return micro post before saving.\n content: #{@micropost.content} \n current user name:  #{@micropost.user.name} \n current user email: #{@micropost.user.email} \n current user id: #{@micropost.user.id} \n"
        if @micropost.save
            print "micro post saved to db.\n"
            flash[:success] = "Micropost created successfully"
            redirect_to root_url
        else
            print "user failed to get saved.\n"
            flash[:danger] = "Invalid post"
            redirect_to root_url
        end
    end

    def destroy
    end

    private
        def micropost_permitted_params
            params.require(:micropost).permit(:content)
        end

end
