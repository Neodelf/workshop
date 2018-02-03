require 'test_helper'

class Web::Articles::CommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @article = articles(:one)
    @comment = comments(:one)
  end

  test 'should create' do
    comment_attrs = { body: @comment.body, commentor: @comment.commentor }
    post article_comments_url(@article.id), params: { article_comment: comment_attrs }

    comment = @article.comments.find_by(body: @comment.body)
    assert_equal(comment.present?, true)
  end

  test 'should destroy' do
    comment = @article.comments.first
    delete article_comment_url(@article.id, comment.id)
  end
end
