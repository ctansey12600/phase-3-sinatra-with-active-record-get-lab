class ApplicationController < Sinatra::Base

  set :default_content_type, 'application/json'

  get '/bakeries' do
    # get all the bakeries from the database
    bakeries = Bakery.all
    # send them back as a JSON array
    bakeries.to_json
  end

  get '/bakeries/:id' do
    # finds bakery from the database using id
    bakery = Bakery.find(params[:id])
    # sends back as a JSON-formatted response of bakery data
    # with baked_goods data included
    bakery.to_json(include: :baked_goods)
  end

  get '/baked_goods/by_price' do
    # get all the baked goods from the database and sort on price
    baked_goods = BakedGood.all.order(price: :desc)
    # send them back as a JSON array
    baked_goods.to_json
  end

  get '/baked_goods/most_expensive' do
     # gets the first most expensive baked_good
    baked_good = BakedGood.all.order(price: :desc).first
    # send them back as a JSON array
    baked_good.to_json
  end

end
