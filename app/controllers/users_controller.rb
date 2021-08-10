class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update]
  before_action :authenticate_user!
  before_action :is_user_owner, only: [:show, :edit, :update]
  # GET /users or /users.json
  def index
    @users = User.all
  end

  # GET /users/1 or /users/1.json
  def show
    @user_futur_events = @user.events
    @user_administrate = Event.where(administrator_id: @user.id)
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: "Vos informations ont bien été mises à jour."
    else
      render :edit
    end
  end

  private

    def is_user_owner
      redirect_to root_path, notice: "Vous n'êtes pas le propriétaire de cette page" if current_user.id != @user.id 
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:description, :first_name, :last_name)
    end
end
