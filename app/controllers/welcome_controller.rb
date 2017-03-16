class WelcomeController < ApplicationController
  def index
    @images = Image.to_shop(current_user)
  end
end
