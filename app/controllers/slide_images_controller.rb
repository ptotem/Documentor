class SlideImagesController < ApplicationController
  # GET /slide_images
  # GET /slide_images.json
  def index
    @slide_images = SlideImage.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @slide_images }
    end
  end

  # GET /slide_images/1
  # GET /slide_images/1.json
  def show
    @slide_image = SlideImage.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @slide_image }
    end
  end

  # GET /slide_images/new
  # GET /slide_images/new.json
  def new
    @slide_image = SlideImage.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @slide_image }
    end
  end

  # GET /slide_images/1/edit
  def edit
    @slide_image = SlideImage.find(params[:id])
  end

  # POST /slide_images
  # POST /slide_images.json
  def create
    @slide_image = SlideImage.new(params[:slide_image])

    respond_to do |format|
      if @slide_image.save
        format.html { redirect_to @slide_image, notice: 'Slide image was successfully created.' }
        format.json { render json: @slide_image, status: :created, location: @slide_image }
      else
        format.html { render action: "new" }
        format.json { render json: @slide_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /slide_images/1
  # PUT /slide_images/1.json
  def update
    @slide_image = SlideImage.find(params[:id])

    respond_to do |format|
      if @slide_image.update_attributes(params[:slide_image])
        format.html { redirect_to @slide_image, notice: 'Slide image was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @slide_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /slide_images/1
  # DELETE /slide_images/1.json
  def destroy
    @slide_image = SlideImage.find(params[:id])
    @slide_image.destroy

    respond_to do |format|
      format.html { redirect_to slide_images_url }
      format.json { head :no_content }
    end
  end
end
