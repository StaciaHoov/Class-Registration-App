class Course < ActiveRecord::Base
    belongs_to :user
    has_many :enrollments
    has_many :students, through: :enrollments
    
    default_scope { order('age_group DESC','time_block ASC') } 
    
    validates :title, length: { maximum: 40 }, presence: true
    validates :user, presence: true
    validates :age_group, presence: true
    
    def openings
        if self.max_students != nil
            self.max_students - self.enrollments.count
        end
    end

    def self.list_by_age_time
        Course.all.group_by(&:age_group).map do |age_group, array_age|  
            [age_group, array_age.group_by(&:time_block)]
        end
    end
    
    
    def self.for_select
    {
      'Tiny'   => where(:age_group => 'tiny').map { |c| [c.id, c.name] },
      'Small'   => where(:age_group => 'small').map { |c| [c.id, c.name] },
      'Medium'   => where(:age_group => 'medium').map { |c| [c.id, c.name] },
      'Big'   => where(:age_group => 'big').map { |c| [c.id, c.name] },
    }
    end
end

