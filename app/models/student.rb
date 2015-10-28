class Student < ActiveRecord::Base
    belongs_to :user
    has_many :courses
    
    validates :name, presence: true
    validates :user, presence: true
    
end
