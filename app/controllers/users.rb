enable :sessions

post '/register' do 
  User.create(name: params["name"], password: params["password"], email: params["email"])
end

get '/users/:id' do
  @urls = User.find(params[:id]).urls 
  
  return erb :public_profile unless current_user
  
  if current_user.id == params[:id].to_i
    @urls = @urls.sort_by{|u| u.count }.reverse 
    erb :private_profile
  else
    erb :public_profile
  end
end



