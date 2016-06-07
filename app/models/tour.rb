class Tour < ActiveRecord::Base
  has_attached_file :cover, :styles => { :medium => "300x300>", :thumb => "100x100>", large: "500x500>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :cover, :content_type => /\Aimage\/.*\Z/
  validates :cover, :title, :description, presence: true
end




