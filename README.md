# Very simple example for API endpoint for uploading images/videos

1) rails intall `app_name` in this example case app_name=upload_howto

2) gem install carrierwave

3) add to GEMFILE: gem 'carrierwave', '~> 1.0'

4) Add uploader with a name you want : rails generate uploader Image

4) add image arbitrary endpoint you want: rails generate controller Images

5) config/routes.rb add: resources :images

6) Go to ImageController(if you named the above Images) and add:

def create
    uploader = ImageUploader.new
    uploader.store!(params[:image])
end

7) Go to ImageUploader and change this:
def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
end

to whatever you want. I did this:
def store_dir
    "uploads/"
end

*The above can forward files to Cloudinary

5) Start server and POST
*if its test project you want to add the following tp application_controller.rb:
protect_from_forgery with: :null_session

6) User Postman or whatever to upload file. With the above setup the url would be:http://localhost:3000/images and the key for the file upload is: image

7) Find the file tom projectdir/public/uploads if you used the above steps including file path

Note: This works for images, files, videos etc. See the ImageUploader to see how to restrict

# simple_rails_image_upload_api_example
