class PhotosController < ApplicationController
  # protect_from_forgery with: :exception
def show
#The params hash looks like this: {the_id_number"=>"1"}

id_number = params["the_id_number"]

@photo = Photo.find(id_number)

@the_caption = @photo.caption

@the_image_url = @photo.source
@created_at = @photo.created_at

render("photos/show.html.erb")
end

def index
  @all_photos = Photo.order({:created_at => :desc })

  render("photos/index.html.erb")
end

def new_form

  render("photos/new.html.erb")
end

def create_row

  #render("photos/create.html.erb")

  p = Photo.new
  p.source = params["the_image_url"]
  p.caption = params["the_caption"]
  p.save
  redirect_to("http://localhost:3000/photos")
end

def edit_form
@photo = Photo.find(params[:the_id])
  render("/photos/edit_form.html.erb")
end

def update_row

  p = Photo.find(params[:the_id])

  p.source = params["the_image_url"]
  p.caption = params["the_caption"]
  p.save

  redirect_to("http://localhost:3000/photos")
end

end
