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
  @stores = Store.all()
  erb(:store_view_all)
end

get('/stores/:id') do
  @brands = Brand.all()
  @store = Store.find(params.fetch('id').to_i())
  erb(:store_view_solo)
end

get('/stores/:id/edit') do
  @store = Store.find(params.fetch('id').to_i())
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

patch('/stores/:id') do
  name = params.fetch('name')
  address = params.fetch('address')
  @store = Store.find(params.fetch('id').to_i())
  if @store.update({:name => name, :address => address})
    erb(:index)
  else
    erb(:store_error)
  end
end

patch('/stores/:id/brands') do

  brand_ids = params.fetch('brand_ids', nil)
  @store = Store.find(params.fetch('id').to_i())
  if @store.update(:brand_ids => brand_ids)
    erb(:index)
  else
    erb(:brand_error)
  end
end

delete('/stores/:id') do
  @store = Store.find(params.fetch('id').to_i())
  if @store.delete
    erb(:index)
  else
    erb(:store_error)
  end
end

get('/brands') do
  @brands = Brand.all()
  erb(:brand_view)
end

get('/brands/new') do
  erb(:brand_new)
end

post('/brands') do
  name = params.fetch('name')
  price = params.fetch('price')
  @brand = Brand.new({:name => name, :price => price})
  if @brand.save()
    erb(:index)
  else
    erb(:store_error)
  end
end
