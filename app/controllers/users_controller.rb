class UsersController < ApplicationController
  
  before_action:cancel_non_login,{only:[:show,:show_followthemes,:show_likeopinions,:edit]}
  before_action:cancel_def_account_users,{only:[:show_followthemes,:show_likeopinions,:edit]}
  before_action:cancel_non_account_users,{only:[:show]}

  def signup
    
  end

  def create
    @user = User.new(
      name: "#{params[:name]}",
      email: "#{params[:email]}",
      password: "#{params[:password]}",
      image_name: "default.jpg"
    )
    @user.save
    session[:user_id] = @user.id
    redirect_to("/themes/index")
  end

  def login_form

  end

  def login
    @user = User.find_by(
      email: "#{params[:email]}",
    )
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:notice]="ログインできました"
      redirect_to("/themes/index")
    else
      render("users/login_form")
    end
  
  end

  def logout
    session[:user_id] = nil
    flash[:notice]="ログアウトしました"
    redirect_to("/")
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def show_followthemes
    @user = User.find_by(id: params[:id])
  end

  def show_likeopinions
    @user = User.find_by(id: params[:id])
  end

  def edit 
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    @user.name = params[:name]
    @user.email = params[:email]
    @user.introduction = params[:introduction]

    if params[:image]
      @user.image_name = "#{params[:id]}.jpg"
      image = params[:image]
      File.binwrite("public/user_image/#{@user.image_name}",
      image.read)
    end
    if @user.save
      redirect_to("/users/#{params[:id]}/show")
    else
      render("users/edit")
    end
  end

  def cancel_def_account_users
    @user=User.find_by(id:params[:id])
    if @user == nil || @current_user.id != @user.id 
      flash[:notice]="権限がありません"
      redirect_to("/themes/index")
    end
  end

  def cancel_non_account_users
    @user=User.find_by(id:params[:id])
    if @user == nil
      flash[:notice]="権限がありません"
      redirect_to("/themes/index")
    end
  end

end
