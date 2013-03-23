module Scroll
  class FigureComponent < Model
    include Scroll::Renderable

    ATTACHMENT_STYLES = { large: "1880x1880>", thumb: "100x100>" }

    if Rails.env.development?
      has_attached_file :image, styles: ATTACHMENT_STYLES
    else
      has_attached_file :image,
        styles: ATTACHMENT_STYLES,
        storage: :fog,
        fog_credentials: {
          provider: "AWS",
          aws_access_key_id: ENV["S3_KEY"],
          aws_secret_access_key: ENV["S3_SECRET"],
          region: ENV["S3_REGION"]
        },
        fog_directory: ENV["S3_BUCKET"]
    end
  end
end
