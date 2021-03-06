class DashboardsController < ApplicationController
  def index
    @dashboards = Dashboard.where(:user_id => @current_user)

  end

  def new
    @user = @current_user
    @dashboard = Dashboard.new
  end

  def dashboard
    @user = @current_user
    dashboard = Dashboard.new
    dashboard.user_id = @user.id
    dashboard.name = params[:name]
    dashboard.save
    @user.dashboards << dashboard
    redirect_back :fallback_location => root_path
  end

  def create
    @user = @current_user
    dashboard = Dashboard.new dashboard_params
    dashboard.user_id = @user.id
    dashboard.save
    redirect_to dashboard_path(dashboard.id)

  end

  def show
    @dashboard = Dashboard.find params[:id]

  end

  def destroy
    @dashboard =  Dashboard.find params[:id]
    @dashboard.destroy
    redirect_to dashboards_path

  end
  def remove
    @dashboard = Dashboard.find params[:dashboard_id]
    @dashboard.locations.destroy(params[:location_id])
    redirect_back :fallback_location => root_path
  end

  def gone
    @dashboard =  Dashboard.find params[:dashboard_id]
    @dashboard.destroy
    redirect_back :fallback_location => root_path
  end

  private
  def dashboard_params
    params.require(:dashboard).permit(:name)
  end
end
