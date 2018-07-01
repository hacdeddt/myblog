class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update]
  before_action :set_id_comment_parent, only: [:destroy]

  # GET /comments
  # GET /comments.json
  def index
    @comments = Comment.all
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
  end

  # GET /comments/new
  def new
    @comment = Comment.new
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments
  # POST /comments.json
  def create

    @comment = Comment.new(comment_params)

    respond_to do |format|
      if @comment.save
        format.html { redirect_back(fallback_location: root_path) }
        format.js
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { redirect_back(fallback_location: root_path) }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    
      @parents.each do |parent|
        @parent = Comment.find(parent)
        @parent.destroy
      end
        @comment.destroy
    respond_to do |format|
      format.js
      format.html { redirect_back(fallback_location: root_path) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end
    def set_id_comment_parent
      @comment = Comment.find(params[:id])
      @parents = Comment.where(["parents_id = ?",@comment.id]).ids
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:email, :name, :content, :post_id, :parents_id)
    end
end
