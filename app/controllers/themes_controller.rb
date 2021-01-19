class ThemesController < ApplicationController

  before_action:cancel_non_login,{only:[:create_form,:index,:show]}

  def index
    @themes=Theme.all.order(id: "DESC")
  end

  def search
    @themes=Theme.where("name Like ?","%#{params[:saerch]}%") .order(id: "DESC")
    @search = "#{params[:saerch]}"
  end

  def show
    @theme=Theme.find_by(id:params[:id])
  end

  def create_form

  end

  def create
    @theme=Theme.new(
      user_id: @current_user.id,
      name: params[:name],
    )
    if @theme.save
      redirect_to("/themes/index")
    else
      flash[:notice]="テーマを入力してください"
      render("themes/create_form")
    end

  end
end
