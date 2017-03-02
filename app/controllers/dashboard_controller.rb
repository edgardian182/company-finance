class DashboardController < ApplicationController
  before_action :require_admin, except: [:welcome]
  def index
    @tab = :dashboard
  end

  def welcome

  end

  def index_user
    @users = User.all
  end

  def new_user
    @user = User.new
  end
end
