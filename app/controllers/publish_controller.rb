class PublishController < ApplicationController
	before_action :set_comment, only: [:destroy]
  def index
  	   @posts = Post.where(["publish = ? ",params[:publish]]).paginate(page: params[:page],per_page: 5)
    	@d = Post.where(["publish = ?", false]).size
    	@p = Post.where(["publish = ?", true]).size
  end
  def destroy
      @comment.destroy
    respond_to do |format|
      format.js
      format.html { redirect_back(fallback_location: root_path) }
      format.json { head :no_content }
    end
  end

  private
  def set_comment
      @comment = Comment.find(params[:id])
    end
end
