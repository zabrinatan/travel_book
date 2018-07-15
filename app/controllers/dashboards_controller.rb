class DashboardsController < ApplicationController
  def index
    @dashboards = Dashboard.all
  end

  def new
      @dashboard = Dashboard.new
  end

  def create
    dashboard = Dashboard.new dashboard_params
    dashboard.save
    redirect_to dashboard_path(dashboard.id)
  end
  def show
      @dashboard = Dashboard.find params[:id]
  end


  private
  def dashboard_params
    params.require(:dashboard).permit(:name)
  end
end
