class UsersController < ApplicationController
  def my_portfolio
    @tracked_stocks = current_user.stocks
  end

  def my_friends
    @friends = current_user.friends
  end

  def search
    @friends = current_user.friends

    if params[:friend].present?
      @searched_friends = User.search(params[:friend])
      @searched_friends = current_user.except_current_user(@searched_friends)
      if @searched_friends
        render 'users/my_friends'
      else
        flash[:alert] = "Couldn't find user"
        redirect_to my_friends_path
      end
    else
      flash[:alert] = "Please enter a friend name or email to search"
      redirect_to my_friends_path
    end
  end
end
