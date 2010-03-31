class SessionsController < Devise::SessionsController
  # GET /auth/login
  def new
    unless resource_just_signed_up?
      Devise::FLASH_MESSAGES.each do |message|
        set_now_flash_message :alert, message if params.try(:[], message) == "true"
      end
    end

    render_with_scope :new
  end

  # POST /auth/login
  def create
    if resource = authenticate(resource_name)
      set_flash_message :notice, :signed_in
      sign_in_and_redirect(resource_name, resource, true)
    else
      set_now_flash_message :alert, (warden.message || :invalid)
      clean_up_passwords(resource)
      render_with_scope :new
    end
  end

  # GET /auth/logout
  def destroy
    set_flash_message :notice, :signed_out if signed_in?(resource_name)
    sign_out_and_redirect(resource_name)
  end
end
