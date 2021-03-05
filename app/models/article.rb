class Article < ApplicationRecord
  validates :title, presence: true, length: { maximum: 40 }
  validates :text, presence: true, length: { minimum: 1 }
  validates :image, presence: true
  belongs_to :author, class_name: 'User'
  has_many :votes

  has_many :article_categories
  has_many :categories, through: :article_categories
  validates :categories, length: { minimum: 1 }

  def self.best
    arr = Article.all.map(&:id)
    unless arr.empty?
      votes = Vote.where(article_id: arr).group(:article_id).count
      best_article = votes.max_by { |_k, v| v }
      Article.find(best_article[0]) if best_article
    end
  end

  def voted_by?(user)
    users = self.votes.map(&:user_id)
    users.any?(user.id)
  end
end
