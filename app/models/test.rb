class Test < ApplicationRecord
  INFINITY_LEVEL = Float::INFINITY

  belongs_to :category
  belongs_to :author, class_name: 'User', foreign_key: :user_id
  has_many :tests_users
  has_many :users, through: :tests_users
  has_many :questions

  validates :title, presence: true
  validates :level, numericality: { only_integer: true, greater_than: 0 }
  validates :title, uniqueness: { scope: :level, message: "Тест с таким названием и уровнем уже существует" }

  scope :titles_by_category, ->(category_name) do
    joins(:category)
    .where(category: { title: category_name })
    .order(title: :desc)
    .pluck(:title)
  end

  scope :easy_level, -> { where(level: 0..1) }
  scope :middle_level, -> { where(level: 2..4) }
  scope :hard_level, -> { where(level: 4..INFINITY_LEVEL) }



end
