class DietsController < ApplicationController
  before_filter  :verify, :get_profile, only: [:get_diets, :index]
  before_filter  :verify, :get_simple_profile, except: [:get_diets, :index]
  respond_to :html, :json

  def get_profile
    @profile = Profile.includes(:diets).find(params[:profile_id])
  end

  def get_simple_profile
    @profile = Profile.find(params[:profile_id])
  end

  def verify
    if profile_signed_in? 
      if params[:profile_id].to_i != current_profile.id
        redirect_to profiles_path()
      else
        return true
      end
    else
        redirect_to new_profile_session_path()
    end

  end 

  # GET /diets
  # GET /diets.json
  def index
    @diets = @profile.diets
    respond_with @diets
  end

  def get_diets
    @profile = Profile.find(params[:id])
    render json: @profile.diets.all.to_json(include: :food_line_items)
  end 

  # GET /diets/1
  # GET /diets/1.json
  def show
    @diet = @profile.diets.includes(:food_line_items).find(params[:id])
    @food_line_item = FoodLineItem.new
    @food_line_items = @diet.food_line_items
    respond_with @diets
  end

  # GET /diets/new
  def new
    @diet = @profile.diets.new
  end

  # GET /diets/1/edit
  def edit
    @diet = @profile.diets.find(params[:id])
  end

  # POST /diets
  # POST /diets.json
  def create
    @diet = @profile.diets.new(params[:diet])

    respond_to do |format|
      if @diet.save
        format.html { redirect_to [@profile,@diet], notice: 'Diet was successfully created.' }
        format.json { render json: @diet, status: :created, location: @diet }
      else
        format.html { render action: "new" }
        format.json { render json: @diet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /diets/1
  # PUT /diets/1.json
  def update
    @diet = @profile.diets.find(params[:id])

    if @diet.update_attributes(params[:diet])
      redirect_to profile_diets_url, notice: 'Diet was successfully updated.'
    else
      render json: @diet.errors, status: :unprocessable_entity
    end
  end

  # DELETE /diets/1
  def destroy
    @diet = @profile.diets.find(params[:id])
    @diet.destroy
   redirect_to profile_diets_url
  end
end
