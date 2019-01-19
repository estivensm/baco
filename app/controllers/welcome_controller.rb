class WelcomeController < ApplicationController
  layout "external"
  skip_before_action :authenticate

  def index
  end
end
