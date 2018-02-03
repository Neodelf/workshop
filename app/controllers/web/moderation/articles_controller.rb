class Web::Moderation::ArticlesController < Web::Moderation::ApplicationController
  def edit
    @article = Web::ModerationArticleType.find(params[:id])
  end

  def update
    @article = Web::ModerationArticleType.find(params[:id])
    if @article.update(web_moderation_article_params)
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
