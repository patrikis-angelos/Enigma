class Category < ApplicationRecord
  validates :name, presence: true
  has_many :article_categories
  has_many :articles, through: :article_categories

  def self.full
    full = ArticleCategory.group(:category_id).count.map { |k, v| k if v.positive? }
    Category.all.where(id: full)
  end

  def last_article
    articles.order(:created_at).last
  end
end
