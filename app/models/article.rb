class Article < ApplicationRecord
  validates :title, presence: true, length: { minimum: 5 }

  has_many :comments, dependent: :destroy
  belongs_to :category, required: false
end
