class Web::ModerationArticleType < Article
  include ApplicationType

  permit :category_id, :title

  validates :category, presence: true
end
