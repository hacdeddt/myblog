class PosttagsController < ApplicationController
  before_action :set_posttag, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /posttags
  # GET /posttags.json
  def index
    @posttags = Posttag.all
  end

  # GET /posttags/1
  # GET /posttags/1.json
  def show
  end

  # GET /posttags/new
  def new
    @posttag = Posttag.new
  end

  # GET /posttags/1/edit
  def edit
  end

  # POST /posttags
  # POST /posttags.json
  def create
    @posttag = Posttag.new(posttag_params)

    respond_to do |format|
      if @posttag.save
        format.html { redirect_to @posttag, notice: 'Posttag was successfully created.' }
        format.json { render :show, status: :created, location: @posttag }
      else
        format.html { render :new }
        format.json { render json: @posttag.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posttags/1
  # PATCH/PUT /posttags/1.json
  def update
    respond_to do |format|
      if @posttag.update(posttag_params)
        format.html { redirect_to @posttag, notice: 'Posttag was successfully updated.' }
        format.json { render :show, status: :ok, location: @posttag }
      else
        format.html { render :edit }
        format.json { render json: @posttag.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posttags/1
  # DELETE /posttags/1.json
  def destroy
    @posttag.destroy
    respond_to do |format|
      format.html { redirect_to posttags_url, notice: 'Posttag was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_posttag
      @posttag = Posttag.where(["tagname = ?",""])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def posttag_params
      params.fetch(:posttag, {})
    end
end
