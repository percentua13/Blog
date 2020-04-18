require 'bcrypt'
class Author < ApplicationRecord
  include BCrypt

  def password_
    @password ||= Password.new(password)
  end

  def password_=(new_password)
    @password = Password.create(new_password)
    self.password = @password
  end

  has_many :comments
end
