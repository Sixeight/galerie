# == Schema Information
# Schema version: 20081126100124
#
# Table name: users
#
#  id              :integer         not null, primary key
#  name            :string(255)
#  hashed_password :string(255)
#  salt            :string(255)
#  admin           :                default("f")
#  group_id        :integer
#

require 'digest/sha1'

class User < ActiveRecord::Base
  has_many :images
  belongs_to :group

  validates_presence_of :name
  validates_uniqueness_of :name

  attr_accessor :password_confirmation
  validates_confirmation_of :password

  def validate
    errors.add_to_base('Please enter your password') if hashed_password.blank?
  end

  def self.authenticate(name, password)
    user = self.find_by_name name
    if user
      expected_password = encrypted_password(password, user.salt)
      if user.hashed_password != expected_password
        user = nil
      end
    end
    user
  end

  def password
    @password
  end

  def password=(pwd)
    @password = pwd
    create_new_salt
    self.hashed_password =
      User.encrypted_password(self.password, self.salt)
  end

  def self.encrypted_password(password, salt)
    string_to_hash = password + 'algorithm' + salt
    Digest::SHA1.hexdigest string_to_hash
  end

  def create_new_salt
    self.salt = self.object_id.to_s + rand.to_s
  end
end
