class ListController  < ApplicationController

  get '/lists' do
    if !Helpers.redirect_if_not_logged_in(session)
        redirect "/login?error=invalid request"
      end
    @lists = Helpers.current_user(session).lists
    erb :'lists/index'
  end


  get "/lists/new" do
    if !Helpers.redirect_if_not_logged_in(session)
        redirect "/login?error=invalid request"
      end
    erb :'lists/new'
  end


  get "/lists/:id/edit" do
    if !Helpers.redirect_if_not_logged_in(session)
        redirect "/login?error=invalid request"
      end
    @list = List.find(params[:id])
    if !Helpers.current_user(session).lists.include?(@list)
      redirect "/lists?error=cannot view that page"
    end
  erb :'lists/edit'
end


  post "/lists/:id" do
    if !Helpers.redirect_if_not_logged_in(session)
        redirect "/login?error=invalid request"
      end
    unless List.valid_params?(params)
      redirect "/lists/new?error=invalid list"
    end
    @list = List.find(params[:id])
    if !Helpers.current_user(session).lists.include?(@list)
      redirect "/lists?error=cannot view that page"
    end
    @list.update(name: params[:name])
    @task = Task.find(params[:id])
    redirect "/lists/#{@list.id}"
  end


get "/lists/:id" do
  if !Helpers.redirect_if_not_logged_in(session)
      redirect "/login?error=invalid request"
    end
  @list = List.find(params[:id])
  if !Helpers.current_user(session).lists.include?(@list)
    redirect "/lists?error=cannot view that page"
  end
  @tasks = @list.tasks.order("importance DESC")
  erb :'lists/show'
end


  post "/lists" do
    if !Helpers.redirect_if_not_logged_in(session)
        redirect "/login?error=invalid request"
      end
    unless List.valid_params?(params)
      redirect "/lists/new?error=invalid list"
    end
    @list = List.create(params)
    @list.save
    Helpers.current_user(session).lists << @list
    redirect "/lists"
    end


  delete '/lists/:id/delete' do
    if !Helpers.redirect_if_not_logged_in(session)
        redirect "/login?error=invalid request"
      end
  @list = List.find(params[:id])
  if !Helpers.current_user(session).lists.include?(@list)
    redirect "/lists?error=cannot view that page"
  end
  @list.delete
  redirect to '/lists'
  end



end
