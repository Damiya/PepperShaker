class UserSerializer
  attributes :id, :email, :param

  def param
    name_portion = email.split('@').first
    "#{id}-#{name_portion.dasherize.parameterize}"
  end
end