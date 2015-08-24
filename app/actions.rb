helpers do
  def current_user
    @current_user = User.find_by(id: session[:user_id]) if session[:user_id]
  end
end

# Homepage (Root path)
get '/' do
  erb :index
end

get '/login' do
    erb :login
end

post '/login' do
  email = params[:email]
  password = params[:password]

  user = User.find_by(email: email)
  if user && user.password == password
    session[:user_id] = user.id
    redirect '/'
  else
    redirect '/login'
  end
end

post '/signup' do
  username = params[:username]
  email = params[:email]
  password = params[:password]
  user = User.create( username: username, email: email,password: password)
  if user
    session[:user_id] = user.id
    redirect '/'
  else
    redirect '/login'
  end
end


get '/profile' do
    erb :profile
end

post '/profile' do
    redirect '/'
end

get '/movies/new' do
    erb :new_movie
end

post '/movies/create' do
  title = params[:title]
  release_date = params[:release_date]
  director = params[:director]
  rating = params[:rating]
  image_url = params[:image_url]
  
  user = User.find_by(id: session[:user_id])
  if user
    film = user.movies.create(title: title, release_date: release_date, director: director, rating: rating, image_url: image_url)
    redirect '/'
  else
    redirect '/login'
  end
end