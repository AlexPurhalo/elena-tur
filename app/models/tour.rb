class Tour < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :images, dependent: :destroy
  belongs_to :category

  def self.search(search)
    if search
      where(["title LIKE ?", "%#{search}%"])
    else
      all
    end
  end
  validates :cover, :title, :description, presence: true
  has_attached_file :cover,
                    styles: { medium: '512x274#', thumb: '100x100>', large: '530x381#' },
                    storage: :s3,
                    bucket: ENV.fetch('S3_BUCKET_NAME'),
                    access_key_id: ENV.fetch('AWS_ACCESS_KEY_ID'),
                    secret_access_key: ENV.fetch('AWS_SECRET_ACCESS_KEY'),
                    s3_region: ENV.fetch('AWS_REGION')

  validates_attachment_content_type :cover, content_type: /\Aimage\/.*\Z/
end
