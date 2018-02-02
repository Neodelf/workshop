class Web::Articles::CommentsController < Web::ApplicationController

  http_basic_authenticate_with name: "viraj", password: "password", only: :destroy

  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    redirect_to web_article_path(@article)
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to web_article_path(@article)
  end

  private
  def comment_params
    params.require(:article_comment).permit(:commentor, :body)
  end
end
