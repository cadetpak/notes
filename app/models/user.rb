class User < ActiveRecord::Base
  # User can have many notes, when user deletes account notes are destroyed too
  has_many :notes, dependent: :destroy

  # using bcrypt! hashes password upon creations
  has_secure_password

  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :email, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
  validates :first_name, :last_name, :email, presence: true

end
