class HomeController < ApplicationController
  skip_before_action :require_login
  def index
    @nome_app = "Tení Verdan Posê"
  end
end
