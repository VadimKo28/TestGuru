class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User', foreign_key: :user_id
  has_many :tests_users
  has_many :users, through: :tests_users
  has_many :questions

  class << self
    def titles_by_category(category_name)
      joins(:category)
      .where(category: { title: category_name })
      .order(title: :desc)
      .pluck(:title)
    end
  end
end
