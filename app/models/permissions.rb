class Permissions < Aegis::Permissions
  role :users
  role :admins

  # define permissions here
  # permission :send_bills do
  #   allow :admins
  # end
end
