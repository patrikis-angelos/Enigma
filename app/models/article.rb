class Article < ApplicationRecord
  validates :title, presence: true, length: { maximum: 40 }
  validates :text, presence: true
  validates :image, presence: true
  belongs_to :author, class_name: 'User'
  has_many :votes

  has_many :article_categories
  has_many :categories, through: :article_categories
  validates :categories, length: { minimum: 1 }

  def self.best
    return unless Article.any?

    votes = Vote.group(:article_id).count
    best_article = votes.max_by { |_k, v| v }
    best_article ? Article.find(best_article[0]) : Article.last
  end

  def voted_by?(user)
    users = votes.map(&:user_id)
    users.any?(user.id)
  end
end
