
# get '/secret_page' do
#   return 403 unless session[:email]
#   erb :secret_page
# end

post '/login' do
  user = User.authenticate(params["email"], params["password"])
  return 403 unless user
  session[:user_id] = user.id
  user.id.to_s
end

post '/logout' do
  session[:user_id] = nil
end


