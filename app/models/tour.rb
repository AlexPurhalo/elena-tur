class Tour < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :images, dependent: :destroy
  validates :cover, :title, :description, presence: true
  has_attached_file :cover,
                    styles: { medium: '548x372#', thumb: '100x100>', large: '566x383#' },
                    storage: :s3,
                    bucket: 'elena-tour',
                    s3_credentials: S3_CREDENTIALS

  validates_attachment_content_type :cover, content_type: /\Aimage\/.*\Z/
end
