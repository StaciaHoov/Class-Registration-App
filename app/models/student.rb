class Student < ActiveRecord::Base
    belongs_to :user
    has_one :schedule, dependent: :destroy
    has_many :courses, through: :schedule

    validates :name, presence: true
    validates :user, presence: true
    
    
end
