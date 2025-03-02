class Test < ApplicationRecord
  INFINITY_LEVEL = Float::INFINITY

  belongs_to :category, optional: true
  belongs_to :author, class_name: 'User', foreign_key: :user_id
  has_many :questions
  has_many :test_passages
  has_many :users, through: :test_passages, dependent: :destroy

  validates :title, presence: true
  validates :title, uniqueness: { scope: :level, message: "Тест с таким названием и уровнем уже существует" }
  validates :level, numericality: { only_integer: true, greater_than: 0 }

  scope :by_category, ->(category_name) do
    joins(:category)
    .where(category: { title: category_name })
  end

  scope :easy_level, -> { where(level: 0..1) }
  scope :middle_level, -> { where(level: 2..4) }
  scope :hard_level, -> { where(level: 4..INFINITY_LEVEL) }

  class << self
    def titles_by_category(category_name)
      by_category(category_name).order(title: :desc).pluck(:title)
    end
  end
end
