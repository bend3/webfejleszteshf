class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]
  before_action :require_admin, only: %i[index show new edit update destroy create]

  # GET /users or /users.json
  def index
    @users = User.all
  end

  # GET /users/1 or /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  def login

  end

  def sign_in
    user = User.find_by(email: user_params['email'])
    if user.nil?
      flash[:notice] = "Ilyen email címmel felhasználó nem található"
      redirect_to login_path
      return
    end
    if user.password == user_params['password']
      session['user_id'] = user.id
      redirect_to root_path
    else
      flash[:notice] = "Helytelen jelszó"
      redirect_to login_path
    end
  end

  def sign_out
    session.destroy
    redirect_to root_path
  end

  def sign_up
    if params['user']['confirmation_password'] == user_params['password']
      begin
        user = User.create!(user_params)
      rescue StandardError
        flash[:notice] = "Ezzel az email címmel már létezik felhasználó"
        redirect_to login_path
        return
      end
      session['user_id'] = user.id
      flash[:notice] = "Sikeres regisztráció"
      redirect_to root_path
    end
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: "User was successfully created." }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def require_admin
    current_user&.admin
  end
  # PATCH/PUT /users/1 or /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password)
    end
end

