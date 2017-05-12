require("bundler/setup")
Bundler.require(:default)
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
  erb(:index)
end

get('/stores/new') do
  erb(:store_new)
end

get('/stores/view') do
  @stores = Stores.all()
  erb(:store_edit)
end
