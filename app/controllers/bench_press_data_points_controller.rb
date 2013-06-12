class BenchPressDataPointsController < ApplicationController
  before_filter :authenticate_user!

  # GET /bench_press_data_points
  # GET /bench_press_data_points.json
  def index
    @bench_press_data_points = BenchPressDataPoint.where("user_id = '#{current_user.id}'")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @bench_press_data_points }
    end
  end

  # GET /bench_press_data_points/1
  # GET /bench_press_data_points/1.json
  def show
    @bench_press_data_point = BenchPressDataPoint.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @bench_press_data_point }
    end
  end

  # GET /bench_press_data_points/new
  # GET /bench_press_data_points/new.json
  def new
    @bench_press_data_point = BenchPressDataPoint.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @bench_press_data_point }
    end
  end

  # GET /bench_press_data_points/1/edit
  def edit
    @bench_press_data_point = BenchPressDataPoint.find(params[:id])
  end

  # POST /bench_press_data_points
  # POST /bench_press_data_points.json
  def create
    @bench_press_data_point = BenchPressDataPoint.new(params[:bench_press_data_point])

    respond_to do |format|
      if @bench_press_data_point.save
        format.html { redirect_to @bench_press_data_point, notice: 'Bench press data point was successfully created.' }
        format.json { render json: @bench_press_data_point, status: :created, location: @bench_press_data_point }
      else
        format.html { render action: "new" }
        format.json { render json: @bench_press_data_point.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /bench_press_data_points/1
  # PUT /bench_press_data_points/1.json
  def update
    @bench_press_data_point = BenchPressDataPoint.find(params[:id])

    respond_to do |format|
      if @bench_press_data_point.update_attributes(params[:bench_press_data_point])
        format.html { redirect_to @bench_press_data_point, notice: 'Bench press data point was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @bench_press_data_point.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bench_press_data_points/1
  # DELETE /bench_press_data_points/1.json
  def destroy
    @bench_press_data_point = BenchPressDataPoint.find(params[:id])
    @bench_press_data_point.destroy

    respond_to do |format|
      format.html { redirect_to bench_press_data_points_url }
      format.json { head :no_content }
    end
  end
end
