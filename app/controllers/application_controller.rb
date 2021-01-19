class ApplicationController < ActionController::Base

    before_action:set_current_user

    def set_current_user
        @current_user = User.find_by(id:session[:user_id])
    end

    def cancel_non_login
        if @current_user == nil
            flash[:notice]="権限がありません"
            redirect_to("/users/login")
        end
    end

end