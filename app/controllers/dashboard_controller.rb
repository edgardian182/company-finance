class DashboardController < ApplicationController
  before_action :require_admin
  def index
    @tab = :dashboard
  end
end
