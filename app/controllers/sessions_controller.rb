class SessionsController < ApplicationController
  def new
  end

# def create
#      if @volunteer = Volunteer.find_by(email: params[:volunteer][:email]).present?
#       if @volunteer.authenticate(params[:volunteer][:password])
#       # Save the volunteer ID in the session so it can be used in
#       # subsequent requests
#         session[:id] = @volunteer.id
#         redirect_to volunteer_path
#       end

#      elsif organization = Organization.find_by(email: params[:organization][:email]).present?
#       if organization.authenticate(params[:organization][:password])
#       # Save the organization ID in the session so it can be used in
#       # subsequent requests
#         session[:id] = organization.id
#         redirect_to organization_path(organization)
#       end
#     else
#       flash[:danger] = 'Invalid email/password combination'
#       render 'new'
#     end
#   end
def create
   @user = User.find_by(email: params[:session][:email].downcase)
    if @user && @user.authenticate(params[:session][:password])
      login_in @user
      redirect_to @user, :notice => "Welcome back, #{@user.fname}"
  else
    #flash.now displays flash messages and disappera as soon as there is an additional request
    flash.now[:danger] = 'Invalid email/password combination' # Not quite right!
    render 'new'
  end
end

  # def create
  #   user = User.find_by(email: params[:session][:email].downcase)
  #   if user && user.authenticate(params[:session][:password])
  #     log_in user
  #     params[:session][:remember_me] == '1' ? remember(user) : forget(user)
  #     redirect_to user
  #   else
  #     flash.now[:danger] = 'Invalid email/password combination'
  #     render 'new'
  #     #create an error message
  #   end
  # end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
