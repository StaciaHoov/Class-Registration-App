class Student < ActiveRecord::Base
    belongs_to :user, dependent: :destroy
    has_one :schedule, dependent: :destroy
    has_many :courses, through: :schedule
    has_many :waitlists, through: :waitlist_student, dependent: :destroy

    validates :name, presence: true
    validates :user, presence: true
    

end
