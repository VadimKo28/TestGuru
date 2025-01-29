class User < ApplicationRecord
  has_many :author_tests, class_name: 'Test'
  has_many :tests_users
  has_many :tests, through: :tests_users

  validates :email, presence: true

  def find_tests_by_level(level)
    self.tests.find_by(level: level)
  end
end
