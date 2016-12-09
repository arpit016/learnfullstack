class Task < ActiveRecord::Base
  belongs_to :project, dependent: destroy
  validates :title, :video, :tag, :project, presence: true
end
