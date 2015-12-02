class Admin::AdminsController < ApplicationController
  layout 'admin'
  http_basic_authenticate_with name: 'admin', password: Rails.application.secrets.admin_pass
end
