class MicropostsController < ApplicationController
before_action :signed_in_user, only: [:create, :destroy, :index]
  def index
  end

  def create
  	 @micropost = current_user.microposts.build( params.require(:micropost).permit(:content,:user_id))
    if @micropost.save
      flash[:success] = "Micropost created!"
      redirect_to root_url
    else
      render 'static_pages/home'
    end
  end

  def destroy

    #binding.pry
    @micropost = current_user.microposts.find_by_id(params[:id])
    @micropost.destroy
    respond_to do |format|
    format.html { redirect_to users_url, notice: 'Users microposts was successfully destroyed.' }
  end

private
def micropost_params
  params.require(:micropost).permit(:content,:user_id)
end
 def signed_in_user
      unless signed_in?
      redirect_to signin_path, notice: "Please sign in." 
    end
  end
end
end