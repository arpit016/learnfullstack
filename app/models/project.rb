class Project < ActiveRecord::Base
    extend FriendlyId
    friendly_id :name, use: [:slugged, :finders]
    
    has_many :tasks, dependent: :destroy
    validates :name, :content, presence: true
    validates :price, presence: true, numericality: { only_integer: true }
    
    has_attached_file :image, styles: { medium: "680x300>", thumb: "170x75>" }
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
    
    has_many :subscriptions
    has_many :users, through: :subscriptions
end
