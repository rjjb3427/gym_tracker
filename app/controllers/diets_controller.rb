class DietsController < ApplicationController
  before_filter  :verify, :get_profile, except: [:get_diets]

  def get_profile
    @profile = Profile.includes(:diets).find(params[:profile_id])
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

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @diets }
    end
  end

  def get_diets
    debugger
    @profile = Profile.find(doorkeeper_token.resource_owner_id)
    render json: @profile.diets.all.to_json(include: :food_line_items)


  end 

  # GET /diets/1
  # GET /diets/1.json
  def show
    @diet = @profile.diets.includes(:food_line_items).find(params[:id])
    @food_line_item = FoodLineItem.new
    @food_line_items = @diet.food_line_items
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @diet }
    end
  end

  # GET /diets/new
  # GET /diets/new.json
  def new
    @diet = @profile.diets.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @diet }
    end
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

    respond_to do |format|
      if @diet.update_attributes(params[:diet])
        format.html { redirect_to profile_diets_url, notice: 'Diet was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @diet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /diets/1
  # DELETE /diets/1.json
  def destroy
    @diet = @profile.diets.find(params[:id])
    @diet.destroy

    respond_to do |format|
      format.html { redirect_to profile_diets_url }
      format.json { head :no_content }
    end
  end
end
