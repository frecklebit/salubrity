class TeamsController < ConfigController
  respond_to :html, :xml, :json
  load_and_authorize_resource
  # before_filter :authenticate_user!, only: [:index, :show, :edit, :update, :destroy]
  # skip_before_filter :authenticate_user!, only: [:new, :create]
  # skip_before_filter :validate_subdomain, only: [:new, :create]
  before_action :set_team, only: [:show, :edit, :update, :destroy]

  def index
    @teams = Team.all
    respond_with(@teams)
  end

  def show
    respond_with(@team)
  end

  def new
    @team = Team.new
    @team.users.build
    respond_with(@team)
  end

  def edit
  end

  def create
    @team = Team.new(team_params)

    if @team.save
      flash[:notice] = "You have successfully signed up, please verify your email before signing in."
      redirect_to subdomain: @team.subdomain, controller: 'devise/sessions', action: "new"
    else
      render :new
    end
  end

  def update
    @team.update(team_params)

    if @team.save
      redirect_to edit_team_path(@team)
    else
      respond_with(@team)
    end
  end

  def destroy
    @team.destroy
    respond_with(@team)
  end

  private
    def set_team
      @team = Team.find(params[:id])
    end

    def team_params
      params.require(:team).permit(:name, :subdomain, :website, :logo, users_attributes: [:name, :surname, :email, :password, :password_confirmation, :role])
    end
end
