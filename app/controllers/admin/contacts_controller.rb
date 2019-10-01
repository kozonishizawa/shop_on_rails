class Admin::ContactsController < ApplicationController
  befor_action :authenticate_admin
  def index
  end

  def show
  end
end
