class Task < ActiveRecord::Base
  belongs_to :project
  validates :title, :video, :tag, :project, presence: true
end
