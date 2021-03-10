class Category < ApplicationRecord
  validates :name, presence: true
  has_many :article_categories
  has_many :articles, -> { order(:created_at) }, through: :article_categories

  scope :with_articles, -> { includes(:articles) }

  def self.full
    full = ArticleCategory.group(:category_id).count.map { |k, v| k if v.positive? }
    Category.all.where(id: full)
  end
end
