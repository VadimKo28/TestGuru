class User < ApplicationRecord
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable,
         :confirmable

  EMAIL_REGEXP = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]{2,}\z/i

  has_many :author_tests, class_name: 'Test'
  has_many :test_passages
  has_many :tests, through: :test_passages

  validates :email, format: { with: EMAIL_REGEXP, message: "не является корректным адресом электронной почты" }
  validates :email, uniqueness: true

  def find_tests_by_level(level)
    self.tests.find_by(level: level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

  def admin?
    self.type == 'Admin'
  end
end
