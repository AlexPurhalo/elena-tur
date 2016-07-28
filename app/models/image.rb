class Image < ActiveRecord::Base
  belongs_to :tour
  belongs_to :user
  has_attached_file :content,
                    styles: { medium: '280x177#' },
                    storage: :s3,
                    bucket: ENV.fetch('S3_BUCKET_NAME'),
                    access_key_id: ENV.fetch('AWS_ACCESS_KEY_ID'),
                    secret_access_key: ENV.fetch('AWS_SECRET_ACCESS_KEY'),
                    s3_region: ENV.fetch('AWS_REGION')

  validates_attachment_content_type :content, content_type: /\Aimage\/.*\Z/
end