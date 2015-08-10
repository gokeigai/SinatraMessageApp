# Homepage (Root path)
get '/' do
  erb :index
end

get '/messages' do
  @messages = Message.all
  erb :'messages/index'
end

get '/messages/new' do
  erb :'messages/new'
end

get '/messages/:id' do
  @message = Message.find params[:id]
  @author_messages = Message.where(author: @message.author)
  erb :'messages/show'
end

post '/messages' do
  @message = Message.new(
    content: params[:content],
    url: params[:url],
    author:  params[:author]
  )
  if @message.save
    redirect '/messages'
  else
    erb :'messages/new'
  end
end