class API::V1::UsersController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :user, except: [:index, :create, :search]
  
  def index
    @users = User.all
  end

  def show
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render :show
    else
      render :transaction_errors, status: 400
    end
  end

  def update
    if @user.update(user_params)
      render :show
    else
      render :transaction_errors, status: 400
    end
  end

  def destroy
    user_id = @user.id 
    @user.destroy
    render json: {id: user_id}
  end

  def search
    @users = User.where("lower(users.name) like ?", "%#{params[:term].downcase}%")
    render :index
  end

  private

  def user
    @user = User.find_by(id: params[:id])
    unless @user
      render json: {error: "User Not Found. ID #{params[:id]} does not exist"}, status: 404
    end
  end

  def user_params
    params.require(:user).permit(:name, :age, :weight,
                                 :dob, :race, :hair_color, 
                                 :eye_color, :alive)
  end

end
