class User < ApplicationRecord
	has_secure_password

	scope :teachers, -> {where is_teacher: true}
	scope :admins, -> {where is_admin: true}

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

	validates :name, presence: true
	validates :password, presence: true, on: :create#, length: { minimum: 6 }
	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }

end
