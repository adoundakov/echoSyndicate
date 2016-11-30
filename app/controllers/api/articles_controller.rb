class Api::ArticlesController < ApplicationController

  def index
    # @articles = Article.all.includes(:source)

    @pairs = Match.all_matched_articles
  end

  def get_articles
    @pairs = Match.get_matched_articles(params[:limit], params[:offset])
    render "api/articles/index"
  end

  def show
    @article = Article.find(params[:id])
  end

  def patch
    @article = Article.find(params[:id])
    if @article.update(article_params)
      render "api/articles/show"
    else
      render json: @article.errors.full_messages, status: 422
    end
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      render "api/articles/show"
    else
      render json: @article.errors.full_messages, status: 422
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
  end

  private

  def article_params
    params.require(:article).permit(:title, :source_name, :date,
                                    :author, :image_url, :article_url,
                                    :description)
  end

end
