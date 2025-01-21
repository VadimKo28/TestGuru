class Category < ApplicationRecord
  has_many :tests

  validates :title, presence: true

  class << self
    def sort_by_title
      order(title: :asc)
    end
  end
end
