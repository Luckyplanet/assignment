class User < ApplicationRecord

  attr_accessor :selected_secret_code

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Validations
  # validates :selected_secret_code, presence: true
  validates_presence_of :type, on: :update

  # Associations
  has_one :secret_code
  has_many :user_roles
  has_many :roles, through: :user_roles

  # Callbacks
  before_create :assign_secret_code
  after_initialize :set_roles
  
  private

  def assign_secret_code
    self.secret_code = SecretCode.find(selected_secret_code)
  end

  def set_roles
    class << self
      Role.find_each do |role|
        define_method("#{role.role_name}?".to_sym){
          roles.include?(role)
        }
      end
    end
  end

end
