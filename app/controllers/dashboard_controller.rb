class DashboardController < ApplicationController
  before_action :require_admin
  def index
    @tab = :dashboard
  end

  def welcome
    
  end
end
