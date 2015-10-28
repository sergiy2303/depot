class WelcomeController < ApplicationController
  def index
    @session = Session.new
  end
end
