class User < ActiveRecord::Base
  authenticates_with_sorcery!
  EMAILCHECK = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :mail, presence: true, length: {maximum: 60}, format: {with: EMAILCHECK }
  validates :name, presence: true, length: {maximum: 60}
  validates :password, confirmation: true, presence: true, length: {minimum: 8}
end
