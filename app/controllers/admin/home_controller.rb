class Admin::HomeController < ApplicationController
  before_action :admin_user, only: [:index]

  def index
  end

  private

    def admin_user
      redirect_to(root_url) unless current_user&.admin?
    end
end
