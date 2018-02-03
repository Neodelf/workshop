require 'test_helper'

class Web::Moderation::ArticlesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @article = articles(:one)
    @category_id = categories(:one).id
  end

  test 'should get edit' do
    article = articles(:one)
    get edit_article_url(article.id)
    assert_response :success
  end

  test 'should update' do
    article_attrs = { title: 'new_title', category_id: @category_id }
    patch article_path(@article.id), params: { article: article_attrs }
    assert_response :redirect
    @article.reload
    assert { @article.title == article_attrs[:title] }
  end

end
