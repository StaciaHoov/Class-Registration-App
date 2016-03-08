class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  has_many :students, dependent: :destroy
  accepts_nested_attributes_for :students, reject_if: :all_blank, allow_destroy: true
  has_many :courses
  
  def admin?
    role == 'admin'
  end
  

end
