class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :role
  has_many :usdis
  has_many :districts, :through => :usdis
  validates :name, length: { minimum: 2 }, presence: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  validates :password, length: { minimum: 2 }, presence: true
  before_save :assign_role

def assign_role
  self.role = Role.find_by name: "Okregowy" if self.role.nil?
end
def admin?
  self.role.name == "Admin"
end
def okregowy?
  self.role.name == "Okregowy"
end
def centralny?
  self.role.name == "Centralny"
end
end
