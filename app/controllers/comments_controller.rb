class CommentsController < ApplicationController
  def new
    @comment = Article.find(params[:article_id]).comments.build
  end

  def create
    article = Article.find(params[:article_id])
    @comment = article.comments.build(comment_params)
    if @comment.save
      redirect_to article_path(article), notice: 'コメントを追加'
    else
      flash.now[:error] = 'コメントできませんでした'
      render :new
    end
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end