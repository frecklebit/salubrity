class SurveysController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_survey, only: [:show, :edit, :update, :destroy]
  layout 'angular'

  # GET /surveys
  # GET /surveys.json
  def index
    add_breadcrumb "← Back to Dashboard", :dashboard_path
    @surveys = current_team.surveys.all
  end

  # GET /surveys/1
  # GET /surveys/1.json
  def show
    add_breadcrumb "← Back to Surveys", :surveys_path
  end

  # GET /surveys/new
  def new
    add_breadcrumb "← Back to Surveys", :surveys_path
    @survey = current_team.surveys.new
  end

  # GET /surveys/1/edit
  def edit
    add_breadcrumb "← Back to Surveys", :surveys_path
  end

  # POST /surveys
  # POST /surveys.json
  def create
    @survey = current_team.surveys.new(survey_params)

    respond_to do |format|
      if @survey.save
        format.html { redirect_to survey_fields_url(@survey), notice: 'Survey was successfully created.' }
        format.json { render :show, status: :created, location: @survey }
      else
        format.html { render :new }
        format.json { render json: @survey.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /surveys/1
  # PATCH/PUT /surveys/1.json
  def update
    respond_to do |format|
      if @survey.update(survey_params)
        format.html { redirect_to edit_survey_url, notice: 'Survey was successfully updated.' }
        format.json { render :show, status: :ok, location: @survey }
      else
        format.html { render :edit }
        format.json { render json: @survey.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /surveys/1
  # DELETE /surveys/1.json
  def destroy
    @survey.destroy
    respond_to do |format|
      format.html { redirect_to surveys_url, notice: 'Survey was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_survey
      @survey = current_team.surveys.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def survey_params
      params.require(:survey).permit(:team_id, :title, :description, :guid, :status)
    end
end