class Comment < ActiveRecord::Base
  belongs_to :tour
  belongs_to :user
end
