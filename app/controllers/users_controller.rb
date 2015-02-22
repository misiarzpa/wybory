class UsersController < ApplicationController
  
  load_and_authorize_resource
   respond_to :html
  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  @joined_on = @user.created_at.to_formatted_s(:short)
  if @user.current_sign_in_at
    @last_login = @user.current_sign_in_at.to_formatted_s(:short)
  else
    @last_login = "never"
  end
end

  # GET /users/new
  def new

  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
       @user = User.new(user_params)
    @user.save
    respond_with(@user)
  end
 # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
def update
if user_params[:password].blank?
user_params.delete(:password)
user_params.delete(:password_confirmation)
end
 
successfully_updated = if needs_password?(@user, user_params)
@user.update(user_params)
else
@user.update_without_password(user_params)
end
 
respond_to do |format|
if successfully_updated
format.html { redirect_to @user, notice: 'User was successfully updated.' }
format.json { head :no_content }
else
format.html { render action: 'edit' }
format.json { render json: @user.errors, status: :unprocessable_entity }
end
end
end
 
protected
def needs_password?(user, params)
params[:password].present?
end 

 


  private


    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :role_id)
    end
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :name, :role_id, :district_ids => [])
    end
end
