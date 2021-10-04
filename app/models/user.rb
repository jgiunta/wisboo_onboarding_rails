# frozen_string_literal: true

class User < ActiveRecord::Base
  has_secure_password

  validates :name, :email, :last_name, :role, presence: true
  validates :email, presence: true, uniqueness: true,
                    format: { with: /\A[^@\s]+@[^@\s]+\z/, message: 'Invalid email' }
  enum role: { basic: 0, admin: 1 }

  class << self
    def authenticate(email, password)
      User.find_by(email: email)&.authenticate(password)
    end
  end
end
