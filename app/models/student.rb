class Student < ActiveRecord::Base
    belongs_to :user
    has_many :enrollments
    has_many :courses, through: :enrollments
    accepts_nested_attributes_for :enrollments, reject_if: :all_blank, allow_destroy: true
    
    validates :name, presence: true
    validates :user, presence: true
    
end
