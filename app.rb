require 'sinatra'
require 'mysql2'

load './activerecord.rb'


#メインメニュー
get '/' do
    search = 0
    params[:title] ||= nil
    params[:category] ||= nil

    if params[:title]    != nil then search = search + 1 end
    if params[:category] != nil then search = search + 2 end

    case search
        when 1 then
            @dvds = Dvd.where("title like ? OR title_kana like ?", "%#{params[:title]}%", "%#{params[:title]}%")
        when 2 then
            @dvds = Dvd.joins(:category).where("category = ?", params[:category])
        when 3 then
            @dvds = Dvd.joins(:category).where("(title like ? OR title_kana like ?) AND category = ?", "%#{params[:title]}%", "%#{params[:title]}%", params[:category])
        else
            @dvds = Dvd.all
    end

    @search = search

    erb :index
end

get '/add' do
    @title = 'get add'
    @categories = Category.all.order(:id)
    @actors = Actor.all.order(:id)


    erb :add
end

post '/add' do
    @title = 'post add'
    erb :add
end



error 400..510 do
    'エラーが発生しました。 - ' + env['sinatra.error'].message
end