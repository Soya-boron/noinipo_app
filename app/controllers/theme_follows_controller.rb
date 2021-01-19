class ThemeFollowsController < ApplicationController
  def create
    @theme_follow=ThemeFollow.new(
      user_id:params[:user_id],
      theme_id:params[:theme_id]
    )
    @theme_follow.save
    redirect_to(request.referer)
  end

  def destroy
    @theme_follow=ThemeFollow.find_by(
      user_id:params[:user_id],
      theme_id:params[:theme_id]
    )
    @theme_follow.destroy
    redirect_to(request.referer)
  end
end
