class UsersController < ApplicationController
  before_action :authorize_request, except: :create
  before_action :find_user, except: %i[create index]

  # GET /users
  def index
    @users = User.all
    render json: @users, status: :ok
  end

  # GET /users/{username}
  def show
    render json: @user, status: :ok
  end

    # POST /users
  def create
    @user = User.new(user_params)
    @user.invitation_token = SecureRandom.urlsafe_base64(nil, false)

    if @user.save
      # Implement logic to send invitation email
      UserMailer.invitation_email(@user).deliver_now
      render json: { message: 'User added successfully. Invitation email sent.' }, status: :created
    else
      render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def confirm_invitation
    @user = User.find_by(invitation_token: params[:token])

    if @user && @user.update(confirmed: true)
      render json: { message: 'User confirmed successfully. You can now log in.' }, status: :ok
    else
      render json: { errors: 'Invalid or expired invitation token.' }, status: :unprocessable_entity
    end
  end

    # PUT /users/{username}
    def update
      unless @user.update(user_params)
        render json: { errors: @user.errors.full_messages },
               status: :unprocessable_entity
      end
    end
  
  # PUT /users/{username}
  def update
    unless @user.update(user_params)
      render json: { errors: @user.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  # DELETE /users/{username}
  def destroy
    @user.destroy
  end

  private

  def find_user
    @user = User.find_by_username!(params[:_username])
    rescue ActiveRecord::RecordNotFound
      render json: { errors: 'User not found' }, status: :not_found
  end

  def user_params
    params.require(:user).permit(:name, :surname, :date_of_birth, :national_id_number, :team, :role, :phone_number)
  end
end
