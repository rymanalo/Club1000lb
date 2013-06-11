class SquatDataPointsController < ApplicationController
  before_filter :authenticate_user!

  # GET /squat_data_points
  # GET /squat_data_points.json
  def index
    @squat_data_points = SquatDataPoint.where("user_id = '#{current_user.id}'")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @squat_data_points }
    end
  end

  # GET /squat_data_points/1
  # GET /squat_data_points/1.json
  def show
    @squat_data_point = SquatDataPoint.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @squat_data_point }
    end
  end

  # GET /squat_data_points/new
  # GET /squat_data_points/new.json
  def new
    @squat_data_point = SquatDataPoint.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @squat_data_point }
    end
  end

  # GET /squat_data_points/1/edit
  def edit
    @squat_data_point = SquatDataPoint.find(params[:id])
  end

  # POST /squat_data_points
  # POST /squat_data_points.json
  def create
    @squat_data_point = SquatDataPoint.new(params[:squat_data_point])

    respond_to do |format|
      if @squat_data_point.save
        format.html { redirect_to @squat_data_point, notice: 'Squat data point was successfully created.' }
        format.json { render json: @squat_data_point, status: :created, location: @squat_data_point }
      else
        format.html { render action: "new" }
        format.json { render json: @squat_data_point.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /squat_data_points/1
  # PUT /squat_data_points/1.json
  def update
    @squat_data_point = SquatDataPoint.find(params[:id])

    respond_to do |format|
      if @squat_data_point.update_attributes(params[:squat_data_point])
        format.html { redirect_to @squat_data_point, notice: 'Squat data point was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @squat_data_point.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /squat_data_points/1
  # DELETE /squat_data_points/1.json
  def destroy
    @squat_data_point = SquatDataPoint.find(params[:id])
    @squat_data_point.destroy

    respond_to do |format|
      format.html { redirect_to squat_data_points_url }
      format.json { head :no_content }
    end
  end
end
