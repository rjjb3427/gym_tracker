class NutritionalInformationsController < ApplicationController
  before_filter :get_food

  def get_food
    @food = Food.find(params[:food_id])
  end

  # GET /nutritional_informations/1
  # GET /nutritional_informations/1.json
  def show
    @nutritional_information = @food.nutritionalInformation

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @nutritional_information }
    end
  end

  # GET /nutritional_informations/new
  # GET /nutritional_informations/new.json
  def new
    @nutritional_information =@food.nutritionalInformations.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @nutritional_information }
    end
  end

  # GET /nutritional_informations/1/edit
  def edit
    @nutritional_information = @food.nutritionalInformation
  end

  # POST /nutritional_informations
  # POST /nutritional_informations.json
  def create
    @nutritional_information = @food.nutritionalInformation.new(params[:nutritional_information])

    respond_to do |format|
      if @nutritional_information.save
        format.html { redirect_to @nutritional_information, notice: 'Nutritional information was successfully created.' }
        format.json { render json: @nutritional_information, status: :created, location: @nutritional_information }
      else
        format.html { render action: "new" }
        format.json { render json: @nutritional_information.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /nutritional_informations/1
  # PUT /nutritional_informations/1.json
  def update
    @nutritional_information = @food.nutritionalInformation

    respond_to do |format|
      if @nutritional_information.update_attributes(params[:nutritional_information])
        format.html { redirect_to @nutritional_information, notice: 'Nutritional information was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @nutritional_information.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /nutritional_informations/1
  # DELETE /nutritional_informations/1.json
  def destroy
    @nutritional_information = @food.nutritionalInformation
    @nutritional_information.destroy

    respond_to do |format|
      format.html { redirect_to nutritional_informations_url }
      format.json { head :no_content }
    end
  end
end
