class RegistrationsController < Devise::RegistrationsController
  # GET /resource/sign_up
  def new
    @user = User.new
  end

  # POST /resource/sign_up
  def create
    @user = User.new(params[:user])
    @user.group = Group.find(params[:group][:id])

    if @user.save
      flash[:user_signed_up] = true
      set_flash_message :notice, :signed_up
      sign_in_and_redirect("user", @user)
    else
      render :new
    end
  end

  # GET /resource/edit
  def edit
    @user = resource
  end

  # PUT /resource
  def update
    @user = resource
    if @user.update_with_password(params[:user])
      set_flash_message :notice, :updated
      redirect_to after_sign_in_path_for(resource)
    else
      render :edit
    end
  end

  # DELETE /resource
  def destroy
    resource.destroy
    set_flash_message :notice, :destroyed
    sign_out_and_redirect(resource)
  end
end
