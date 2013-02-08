class FoodsController < ApplicationController
  before_filter :verify
  before_filter :load_types, :only => [:index, :new, :edit, :create, :update] 
  respond_to :html, :json

  def verify
    if !profile_signed_in? 
        redirect_to new_profile_session_path()
    end
  end 

  def load_types 
        @foodTypes = Type.all.collect { |t| [t.name, t.id] }
  end

  def change_type
    @foods = Food.includes(:type).where( type_id: params['type']['type_id']).paginate(page: params[:page])
    render partial: 'foods', locals: { foods: @foods }
  end

  # GET /foods
  # GET /foods.json
  def index
    @food_type_id = @foodTypes.first
    
    if params['type'].nil?
      @foods = Food.includes(:type).where( type_id: @food_type_id).paginate(page: params[:page])
    else
      @foods = Food.includes(:type).where( type_id: params['type']['type_id']).paginate(page: params[:page])
    end 

    respond_with(@foods)
  end

  # GET /foods/1
  # GET /foods/1.json
  def show
    @food = Food.find(params[:id])
    respond_with(@food)
  end

  # GET /foods/new
  # GET /foods/new.json
  def new
    @food = Food.new
    respond_with(@food)
  end

  # GET /foods/1/edit
  def edit
    @food = Food.find(params[:id])
  end

  # POST /foods
  # POST /foods.json
  def create
    @food = Food.new(params[:food])

    respond_to do |format|
      if @food.save
        format.html { redirect_to foods_path(), notice: 'Food was successfully created.' }
        format.json { render json: @food, status: :created, location: @food }
      else
        format.html { render action: "new" }
        format.json { render json: @food.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /foods/1
  # PUT /foods/1.json
  def update
    @food = Food.find(params[:id])

    respond_to do |format|
      if @food.update_attributes(params[:food])
        format.html { redirect_to foods_path(), notice: 'Food was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @food.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /foods/1
  def destroy
    @food = Food.find(params[:id])
    @food.destroy
    redirect_to foods_url
  end
end
