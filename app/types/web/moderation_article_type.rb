class Web::ModerationArticleType < Article
  include ApplicationType

  permit :category_id

  validates :category, presence: true
end
