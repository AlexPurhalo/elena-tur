class Image < ActiveRecord::Base
  belongs_to :tour
  belongs_to :user
  has_attached_file :content, :styles => { :medium => "280x180#" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :content, :content_type => /\Aimage\/.*\Z/
end
