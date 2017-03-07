get '/entries' do
  @entries = Entry.all
  erb :'entries/index'
end

get '/entries/new' do
  @entry = Entry.new
  erb :'entries/new'
end

post '/entries' do
  @entry = Entry.new(params[:entry])

  tag_strings = params[:tags].split(',')

  tags = tag_strings.map do |string|
    Tag.find_or_create_by(name: string.strip)
  end

  @entry.tags = tags

  if @entry.save
    redirect '/entries'
  else
    erb :'entries/new'
  end
end

delete "/entries/:id" do
  @entry = Entry.find(params[:id])
  @entry.destroy
  redirect '/entries'
end