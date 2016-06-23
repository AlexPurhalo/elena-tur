class Image < ActiveRecord::Base
  belongs_to :tour
  belongs_to :user
  has_attached_file :content,
                    styles: { medium: '280x180#' },
                    storage: :s3,
                    bucket: 'elena-tour',
                    s3_credentials: S3_CREDENTIALS

  validates_attachment_content_type :content, content_type: /\Aimage\/.*\Z/
end