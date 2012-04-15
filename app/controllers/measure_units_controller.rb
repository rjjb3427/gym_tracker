class MeasureUnitsController < ApplicationController
  # GET /measure_units
  # GET /measure_units.json
  def index
    @measure_units = MeasureUnit.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @measure_units }
    end
  end

  # GET /measure_units/1
  # GET /measure_units/1.json
  def show
    @measure_unit = MeasureUnit.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @measure_unit }
    end
  end

  # GET /measure_units/new
  # GET /measure_units/new.json
  def new
    @measure_unit = MeasureUnit.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @measure_unit }
    end
  end

  # GET /measure_units/1/edit
  def edit
    @measure_unit = MeasureUnit.find(params[:id])
  end

  # POST /measure_units
  # POST /measure_units.json
  def create
    @measure_unit = MeasureUnit.new(params[:measure_unit])

    respond_to do |format|
      if @measure_unit.save
        format.html { redirect_to measure_units_path(), notice: 'Measure unit was successfully created.' }
        format.json { render json: @measure_unit, status: :created, location: @measure_unit }
      else
        format.html { render action: "new" }
        format.json { render json: @measure_unit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /measure_units/1
  # PUT /measure_units/1.json
  def update
    @measure_unit = MeasureUnit.find(params[:id])

    respond_to do |format|
      if @measure_unit.update_attributes(params[:measure_unit])
        format.html { redirect_to @measure_unit, notice: 'Measure unit was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @measure_unit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /measure_units/1
  # DELETE /measure_units/1.json
  def destroy
    @measure_unit = MeasureUnit.find(params[:id])
    @measure_unit.destroy

    respond_to do |format|
      format.html { redirect_to measure_units_url }
      format.json { head :no_content }
    end
  end
end
