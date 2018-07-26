class ListController  < ApplicationController

  get '/lists' do
    @lists = List.all
    erb :'lists/index'
  end

end
