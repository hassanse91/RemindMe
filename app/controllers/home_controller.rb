class HomeController < ApplicationController
  
  def index
  	@links = Link.where(user_id: current_user.id).order('id DESC')  if user_signed_in?
    @users = User.all if user_signed_in?
  	@posts = Post.where(user_id: current_user.id).order('id DESC')  if user_signed_in?

  end


  def create
    @post = current_user.posts.build(post_params)
    @post.user = current_user
    @post.save

      if @post.save
        redirect_to root_post
      else
       render 'new'
      end
   
    end


 def post_params
      params.require(:post).permit(:title, :body, :user_id)
  end

end
