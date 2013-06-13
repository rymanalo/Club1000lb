class DeadliftDataPointsController < ApplicationController
  before_filter :authenticate_user!

  # GET /deadlift_data_points
  # GET /deadlift_data_points.json
  def index
    @deadlift_data_points = DeadliftDataPoint.where("user_id = '#{current_user.id}'")
    @max_deadlift = (@deadlift_data_points.map {|point| point['weight']}).max || 0

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @deadlift_data_points }
    end
  end

  # GET /deadlift_data_points/1
  # GET /deadlift_data_points/1.json
  def show

    redirect_to :action => "index"
    # @deadlift_data_point = DeadliftDataPoint.find(params[:id])

    # respond_to do |format|
    #   format.html # show.html.erb
    #   format.json { render json: @deadlift_data_point }
    # end
  end

  # GET /deadlift_data_points/new
  # GET /deadlift_data_points/new.json
  def new
    @deadlift_data_point = DeadliftDataPoint.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @deadlift_data_point }
    end
  end

  # GET /deadlift_data_points/1/edit
  def edit
    @deadlift_data_point = DeadliftDataPoint.find(params[:id])
  end

  # POST /deadlift_data_points
  # POST /deadlift_data_points.json
  def create
    @deadlift_data_point = DeadliftDataPoint.new(params[:deadlift_data_point])

    respond_to do |format|
      if @deadlift_data_point.save
        format.html { redirect_to @deadlift_data_point, notice: 'Deadlift data point was successfully created.' }
        format.json { render json: @deadlift_data_point, status: :created, location: @deadlift_data_point }
      else
        format.html { render action: "new" }
        format.json { render json: @deadlift_data_point.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /deadlift_data_points/1
  # PUT /deadlift_data_points/1.json
  def update
    @deadlift_data_point = DeadliftDataPoint.find(params[:id])

    respond_to do |format|
      if @deadlift_data_point.update_attributes(params[:deadlift_data_point])
        format.html { redirect_to @deadlift_data_point, notice: 'Deadlift data point was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @deadlift_data_point.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /deadlift_data_points/1
  # DELETE /deadlift_data_points/1.json
  def destroy
    @deadlift_data_point = DeadliftDataPoint.find(params[:id])
    @deadlift_data_point.destroy

    respond_to do |format|
      format.html { redirect_to deadlift_data_points_url }
      format.json { head :no_content }
    end
  end
end
