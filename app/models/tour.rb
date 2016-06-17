class Tour < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :images, dependent: :destroy
  has_attached_file :cover, :styles => { :medium => "548x372#", :thumb => "100x100>", large: "566x383#" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :cover, :content_type => /\Aimage\/.*\Z/
  validates :cover, :title, :description, presence: true
end




