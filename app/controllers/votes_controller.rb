class VotesController < ApplicationController
  def create
    article = Article.find(params[:article_id])
    @vote = article.votes.build(user_id: current_user.id)
    @vote.save
    redirect_to root_path
  end

  def destroy
    @vote = Vote.find(params[:id])
    @vote.destroy
    redirect_to root_path
  end
end
