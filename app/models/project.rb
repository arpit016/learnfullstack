class Project < ActiveRecord::Base
    has_many :tasks, dependent: :destroy
    validates :name, :content, presence: true
    validates :price, presence: true, numericality: { only_integer: true }
end
