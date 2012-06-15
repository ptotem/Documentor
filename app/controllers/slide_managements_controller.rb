class SlideManagementsController < ApplicationController

  def index
    @concept=Concept.find(params[:concept_id])
    @slides=@concept.slides
    @slide_count=@slides.count

  end

  def add_new_slide
    @slide=Slide.new
    @images=Array.new

    #title slide
    if params["slide_layout"]=="1"
      @xpos=params["xpos"]
      @ypos=params["ypos"]
      @slidetitle=params["slidetitle"]
      @pos=params["pos"]
      @width=params["width"]
      @fontsize=params["font-size"]

      #bullet llist slide
    elsif params["slide_layout"]=="2"
      @bullets=Array.new
      @bullets[0]=params["bull1"]
      @bullets[1]=params["bull2"]
      @bullets[2]=params["bull3"]
      @bullets[3]=params["bull4"]
      @bullets[4]=params["bull5"]

      #slidorion slide
    elsif params["slide_layout"]=="3"
      @images= Array.new
      @count=2
      if params["slide_title"]
        #render :text => params
        #return
        @count=params["img_count"].to_i
        @count.times do |i|
          @images[i]=[params["image"+(i+1).to_s], params["slidesc"+(i+1).to_s]]
        end

      end

      @slide_title=params["slide_title"]
      @font_size=params["font_size"]

    end


  end

  def show_slide

    @xpos=params["xpos"]
    @ypos=params["ypos"]
    @slidetitle=params["slidetitle"]
    @pos=params["pos"]
    @width=params["width"]
    @fontsize=params["font-size"]

    redirect_to content_management_path(:show_slide => 1, :concept_id => params["concept_id"])
  end


  def save_slide
    @slide=Slide.new
    @slide.concept_id=params[:concept_id]
    @slide.html_block= params["content_text"]
    @slide.save!
    redirect_to root_path

  end

  def view_slides

    @concept=Concept.find(params[:concept_id])
    @slides=@concept.slides
    if params[:slide_number]
      @slide_number=params[:slide_number].to_i


    else
      @slide_number=0

    end
    @slide=@slides[@slide_number]

  end

end
