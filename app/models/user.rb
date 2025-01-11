class User < ApplicationRecord
  has_many :tests

  def find_tests_by_level(level)
    self.tests.find_by(level: level)
  end
end
