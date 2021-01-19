class OpinionsController < ApplicationController
  
  before_action:cancel_non_login,{only:[:create_form,:show,:edit]}
  before_action:cancel_def_account_opinions,{only:[:show,:edit]}


  def create_form
    @theme=Theme.find_by(id:params[:id])
  end

  def create
    @opinion=Opinion.new(
      user_id: @current_user.id,
      content: params[:content],
      theme_id: params[:id]
    )
    if @opinion.save
      flash[:notice]="意見を投稿しました"
      redirect_to("/themes/#{params[:id]}/show")
    else
      flash[:notice]="意見を書いてください"
      render("opinions/create_form")
    end
  end

  def destroy
    @opinion=Opinion.find_by(id:params[:id])
    @opinion.destroy
    redirect_to("/users/#{@opinion.user_id}/show")
  end
  
  def edit
    @opinion=Opinion.find_by(id:params[:id])
  end

  def update
    @opinion=Opinion.find_by(id:params[:id])
    @opinion.content = params[:content]
    if @opinion.save
      redirect_to("/users/#{@opinion.user_id}/show")  
    else
      render("opinions/edit")
    end

  end

  def show
  end

  def cancel_def_account_opinions
    @opinion=Opinion.find_by(id:params[:id])
    if @opinion == nil || @current_user.id != @opinion.user_id 
      flash[:notice]="権限がありません"
      redirect_to("/themes/index")
    end
  end

end
