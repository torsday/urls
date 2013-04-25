
get '/' do
  # Look in app/views/index.erb
  @lucky = Url.all.sample.shortened
  erb :index
end

post '/url' do
  # user = find it based on session
  user = current_user # set user to the current user or nil
  url = Url.create(original: params["original_url"], user: user)
  return url.shortened if url.valid?
  # return url.errors.messages[:original].first if url.invalid?
  return 404
end



get '/:shortened' do
  url = Url.find_by_shortened(params[:shortened])
  url.increment_count!
  redirect url.original
end

