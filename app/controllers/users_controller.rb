class UsersController < ApplicationController


def show
    @user = User.find(params[:id])
end

  def new
    @user = User.new
  end


# def create
#     @user = User.new(params[:user])
#     if @user.save
#       flash[:notice] = "You signed up successfully"
#       flash[:color]= "valid"
#     else
#       flash[:notice] = "Form is invalid"
#       flash[:color]= "invalid"
#     end
#     render "new"
#   end



# def create
#     @user = User.new(user_params)
#     # respond_to do |format|
#       if @user.save
#         # format.html {
#         redirect_to @user, notice: 'User was successfully created.'
#         # format.json { render :show, status: :created, location: @user }
#       else
#         # format.html {
#         render :new
#         # format.json { render json: @user.errors, status: :unprocessable_entity }
#       end
#     # end #format.html/json
#   end

########################
  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      flash[:danger] = "Incorrect email/password"
      render 'new'
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:fname, :lname, :email, :password)
    end
end
