class WelcomeController < ApplicationController
  before_action :require_guest
  def index
    @session = Session.new
  end
end
