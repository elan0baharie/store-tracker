require("bundler/setup")
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
  erb(:index)
end

get('/stores') do
  erb(:store_new)
end

get('/stores/view') do
  @stores = Stores.all()
  erb(:store_edit)
end

post('/stores') do
  name = params.fetch('name')
  address = params.fetch('address')
  @store = Store.new({:name => name, :address => address})
  if @store.save()
    erb(:index)
  else
    erb(:store_error)
  end
end
