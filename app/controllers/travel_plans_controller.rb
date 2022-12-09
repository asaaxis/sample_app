class TravelPlansController < ApplicationController
  before_action :set_travel_plan, only: [:show, :edit, :update, :destroy]

  # GET /travel_plans
  def index
    @travel_plans = Team.find(params[:team_id]).travel_plans
  end

  # @tasks = Team.find(params[:team_id]).tasks

  # GET /travel_plans/1
  def show
    @comments = @travel_plan.comments
    @comment = @travel_plan.comments.build
    # binding.pry
    @team = Team.find(params[:team_id])

  end

  # GET /travel_plans/new
  def new
    @travel_plan = TravelPlan.new
    # @team = Team.find(params[:team_id])

  end

  # GET /travel_plans/1/edit
  def edit
    # @travel_plan.team = Team.find(params[:team_id])
  end

  # POST /travel_plans
  def create
    @travel_plan = TravelPlan.new(travel_plan_params)
    @travel_plan.team = Team.find(params[:team_id])
    # @travel_plan.team_id = 
    # @travel_plan = travel_plans.build(travel_plan_params)
    # current_user.keep_team_id = @travel_plan.team.id
    if @travel_plan.save
      # byebug
      redirect_to team_travel_plans_path, notice: 'Travel plan was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /travel_plans/1
  def update
    # @travel_plan.team = Team.find(params[:team_id])
    if @travel_plan.update(travel_plan_params)
      redirect_to team_travel_plans_path, notice: 'Travel plan was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /travel_plans/1
  def destroy
    @travel_plan.destroy
    redirect_to team_travel_plans_path, notice: 'Travel plan was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_travel_plan
      @travel_plan = TravelPlan.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def travel_plan_params
      params.require(:travel_plan).permit(:name, :start_schedule, :end_schedule)
    end
end
