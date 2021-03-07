class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 20 }, uniqueness: true

  has_many :articles, foreign_key: :author_id
  has_many :votes

  def find_users_vote(article)
    vote = votes.find_by(article_id: article.id)
    vote.id
  end
end
