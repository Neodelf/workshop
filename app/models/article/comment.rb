class Article::Comment < ApplicationRecord
  belongs_to :article
end
