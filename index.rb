require 'sinatra'
require './mods_display_model'
require 'net/http'

get '/' do
  set_page_title
  erb :index
end

post '/mods' do
  mods_action
end

get '/mods' do
  mods_action
end

def set_page_title
  @page_title = "ModsDisplay"
end

def mods_action
  set_page_title
  @mods = mods params[:mods]
  erb :mods
end

def mods param
  begin
    if param.strip =~ /^http:\/\/|^https:\/\//
      mods_text = Net::HTTP.get(URI.parse(param.strip))
    else
      mods_text = param
    end
    mods_model = ModsDisplayModel.new(mods_text)
    mods_model.render_mods_display(mods_model).to_html
  rescue
    "Unable to process MODS"
  end
end


