class FieldsController < ApplicationController
  load_and_authorize_resource
  layout 'angular'

  def index
    @survey = current_team.surveys.find(params[:survey_id])
  end
end
