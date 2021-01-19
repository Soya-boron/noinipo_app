class OpinionLikesController < ApplicationController
  def create
    @opinion_like=OpinionLike.new(
      user_id:params[:user_id],
      opinion_id:params[:opinion_id]
    )
    @opinion_like.save
    redirect_to(request.referer)
  end

  def destroy
    @opinion_like=OpinionLike.find_by(
      user_id:params[:user_id],
      opinion_id:params[:opinion_id]
    )
    @opinion_like.destroy
    redirect_to(request.referer)
  end
end
