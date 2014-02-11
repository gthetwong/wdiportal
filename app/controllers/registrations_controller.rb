class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(resource)
    '/gists'
  end

  def after_sign_in_path(resource)
    '/gists'
  end
end
