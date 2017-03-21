module WelcomeHelper
  def jwplayer_video_tag video_id
    src = "//content.jwplatform.com/players/#{video_id}-#{ENV["JWPLAYER_VIDEO_ID"]}.js"
    "<script src=#{src}></script>"
  end
end
