class Article < ApplicationRecord
  validates :title, presence: true, length: { maximum: 40 }
  validates :text, presence: true, length: { minimum: 1 }
  validates :image, presence: true
  belongs_to :author, class_name: "User"
  has_many :votes

  has_many :article_categories
  has_many :categories, through: :article_categories
end
