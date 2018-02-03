class Article < ApplicationRecord
  include AASM

  aasm :column => 'state' do
    state :draft, initial: true
    state :moderation, :published

    event :moderate do
      transitions from: :draft, to: :moderation
    end

    event :publish do
      transitions from: :moderation, to: :published
    end
  end

  validates :title, presence: true, length: { minimum: 5 }

  has_many :comments, dependent: :destroy
  belongs_to :category, required: false
end
