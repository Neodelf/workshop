require 'test_helper'

class Web::ArticlesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @article = articles(:one)
  end

  test 'should get index' do
    get articles_url
    assert_response :success
  end

  test 'shoult get show' do
    get article_url(@article.id)
    assert_response :success
  end

  test 'should get new' do
    get new_article_url
    assert_response :success
  end

  test 'should create' do
    article_attrs = { title: 'new_title', text: 'text' }
    assert_difference('Article.count', 1) do
      post articles_url, params: { article: article_attrs }
    end
  end

  test 'should destroy' do
    delete article_url(@article.id)
    assert_response :redirect
    assert { !Article.exists? id: @article }
  end
end
