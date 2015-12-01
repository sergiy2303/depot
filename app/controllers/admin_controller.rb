class AdminController < ApplicationController
  http_basic_authenticate_with name: "admin", password: Rails.application.secrets.admin_key
end
