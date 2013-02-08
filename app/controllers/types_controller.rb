class TypesController < ApplicationController
  before_filter :verify
  respond_to :html, :json

  def verify
    if !profile_signed_in? 
        redirect_to new_profile_session_path()
    end

  end 
  # GET /types
  # GET /types.json
  def index
    @types = Type.all
    respond_with @types
  end

  # GET /types/1
  # GET /types/1.json
  def show
    @type = Type.find(params[:id])
    respond_with @types
  end

  # GET /types/new
  # GET /types/new.json
  def new
    @type = Type.new
    respond_with @types
  end

  # GET /types/1/edit
  def edit
    @type = Type.find(params[:id])
  end

  # POST /types
  # POST /types.json
  def create
    @type = Type.new(params[:type])

    respond_to do |format|
      if @type.save
        format.html { redirect_to types_path(), notice: 'Type was successfully created.' }
        format.json { render json: @type, status: :created, location: @type }
      else
        format.html { render action: "new" }
        format.json { render json: @type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /types/1
  # PUT /types/1.json
  def update
    @type = Type.find(params[:id])

    respond_to do |format|
      if @type.update_attributes(params[:type])
        format.html { redirect_to types_path(), notice: 'Type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /types/1
  # DELETE /types/1.json
  def destroy
    @type = Type.find(params[:id])
    @type.destroy
    redirect_to types_url
  end
end
