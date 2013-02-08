class NutritionalInformationsController < ApplicationController
  before_filter :get_food
  respond_to :html, :json

  def get_food
    @food = Food.find(params[:food_id])
  end

  # GET /nutritional_informations/1
  def show
    @nutritional_information = @food.nutritional_information
  end

  # GET /nutritional_informations/new
  # GET /nutritional_informations/new.json
  def new
    @nutritional_information = @food.build_nutritional_information
  end

  # GET /nutritional_informations/1/edit
  def edit
    @nutritional_information = @food.nutritional_information
  end

  def create
    @nutritional_information = @food.build_nutritional_information(params[:nutritional_information])
    @nutritional_information.save
    redirect_to food_path(@food)
  end

  # PUT /nutritional_informations/1
  # PUT /nutritional_informations/1.json
  def update
    @nutritional_information = @food.nutritional_information
    @nutritional_information.update_attributes(params[:nutritional_information])
    respond_with(@food,@nutritional_information)
  end
end