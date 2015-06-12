class UsersController < ApplicationController

  def new
    @action = users_path
    render :new
  end

  def create

    all_users = User.all.map { |x| x.email }
    passhash = Digest::SHA1.hexdigest(params[:password])
    if all_users.include?(params[:email])
      flash[:error] = "That e-mail already exists."
      render :new

    else @user = User.find_or_create_by(email: params[:email],
                             password: passhash)
      redirect_to :root
    end
    # redirect_to :root


    # if User.where(email: params[:email]).count.zero?
        # User.create(fill this in)
        # else
        # flash
        # end
  end

  def index
    @user = User.all
  end

end
