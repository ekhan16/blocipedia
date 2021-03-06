class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  has_many :wikis
  has_many :collaborators

  after_initialize :init

  def init
  	self.role ||= true if self.role.nil?
  end

  def admin?
  	role == 'admin'
  end

  def standard?
  	role == 'standard'
  end

  def premium?
  	role == 'premium'
  end
end
