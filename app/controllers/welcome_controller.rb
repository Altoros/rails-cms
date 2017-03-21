class WelcomeController < ApplicationController
  def index
    client = JWPlayer::API::Client.new
    url = client.signed_url('videos/list')
    @videos = HTTParty.get(url)["videos"]
    @images = Image.to_shop(current_user)
  end
end
