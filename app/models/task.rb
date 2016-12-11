class Task < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: [:slugged, :finders]
  
  belongs_to :project
  validates :title, :video, :tag, :project, presence: true
end
