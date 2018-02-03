class Web::Moderation::ArticlesController < Web::Moderation::ApplicationController
  def create
    @article = Article.find(params[:id])
    if @article && @article.may_moderate?
      @article.moderate!
    else
      puts @article.errors.full_messages
    end
    redirect_to articles_path
  end

  def edit
    @article = Web::ModerationArticleType.find(params[:id])
  end

  def update
    @article = Web::ModerationArticleType.find(params[:id])
    if @article.update_attributes(web_moderation_article_params)
      redirect_to @article
    else
      render :edit
    end
  end

  private

    def web_moderation_article_params
      params.fetch(:article, {})
    end
end
