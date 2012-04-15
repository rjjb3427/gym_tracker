class FoodLineItemsController < ApplicationController
  before_filter :get_diet

  def get_diet
      @diet = Diet.find(params[:diet_id])
  end 

  # POST /food_line_items
  # POST /food_line_items.json
  def create
    @food_line_item = @diet.food_line_items.new
    
    @food_line_item.food = Food.find(params[:food_line_item][:food_id])
    @food_line_item.ammount = params[:food_line_item][:ammount]    

    if @food_line_item.save
      render @food_line_item, status: :created
    else
      render json: @food_line_item.errors, status: :unprocessable_entity
    end

  end

  # PUT /food_line_items/1
  # PUT /food_line_items/1.json
  def update
    @food_line_item = FoodLineItem.find(params[:id])
    
    @food_line_item.food = Food.find(params[:food_line_item][:food_id])
    @food_line_item.ammount = params[:food_line_item][:ammount]
    
    if @food_line_item.save
      render json: @food_line_item,include: :food, status: :ok, location: @diet_food_line_item
    else
      render json: @food_line_item.errors, status: :unprocessable_entity
    end

  end

  # DELETE /food_line_items/1
  # DELETE /food_line_items/1.json
  def destroy
    @food_line_item = FoodLineItem.find(params[:id])
    @food_line_item.destroy

    respond_to do |format|
      format.html { redirect_to @food_line_item.diet }
      format.json { head :no_content }
    end
  end
end