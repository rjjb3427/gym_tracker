class DietsController < ApplicationController
  # GET /diets
  # GET /diets.json
  def index
    @diets = Diet.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @diets }
    end
  end

  # GET /diets/1
  # GET /diets/1.json
  def show
    @diet = Diet.find(params[:id])
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
    @diet = Diet.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @diet }
    end
  end

  # GET /diets/1/edit
  def edit
    @diet = Diet.find(params[:id])
  end

  # POST /diets
  # POST /diets.json
  def create
    @diet = Diet.new(params[:diet])

    respond_to do |format|
      if @diet.save
        format.html { redirect_to @diet, notice: 'Diet was successfully created.' }
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
    @diet = Diet.find(params[:id])

    respond_to do |format|
      if @diet.update_attributes(params[:diet])
        format.html { redirect_to @diet, notice: 'Diet was successfully updated.' }
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
    @diet = Diet.find(params[:id])
    @diet.destroy

    respond_to do |format|
      format.html { redirect_to diets_url }
      format.json { head :no_content }
    end
  end
end
