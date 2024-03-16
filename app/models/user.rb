# frozen_string_literal: true

class User < ActiveRecord::Base
  extend Devise::Models
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

      include DeviseTokenAuth::Concerns::User
  has_many :news

  # validates :username, presence: true, uniqueness: true

  # enum role: [:user, :admin]
  enum role: { user: 'user', admin: 'admin' }

  validates :role, inclusion: { in: %w(user admin), message: "%{value} is not a valid role" }
  # after_initialize :set_default_role, :if => :new_record?
  
  # def set_default_role
  # self.role ||= :user
  # end
  
  # def admin?
  # self.role == "admin"
  # end
  
  # def user?
  # self.role == "user"
  # end

  # def token_validation_response
  #   as_json.merge({ role: self.role })
  # end
end
