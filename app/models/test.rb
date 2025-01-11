class Test < ApplicationRecord
  belongs_to :category
  belongs_to :user
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
