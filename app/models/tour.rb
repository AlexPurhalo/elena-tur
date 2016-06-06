class Tour < ActiveRecord::Base
  has_attached_file :cover, styles: { large: '500x700>', medium: '300x300>', thumb: '100x100>' }
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
end

