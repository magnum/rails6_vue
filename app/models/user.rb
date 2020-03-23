class User < ApplicationRecord
  has_paper_trail

  
  # Include default devise modules. Others available are:
  # 
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :timeoutable, :trackable, :omniauthable

  rolify :before_add => :before_add_method
  def before_add_method(role)
    # do something before it gets added
  end

  after_create :assign_default_role
  def assign_default_role
    self.add_role(:newuser) if self.roles.blank?
  end

  validates :firstname, presence: true
  validates :lastname, presence: true

end
