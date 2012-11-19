class TitleSlideCell < Cell::Rails

  def no_anim(args)
    @title=args[:title]
    @banner_image=args[:banner_img]
    @font_size=args[:font_size]
    @text_shadow=args[:text_shadow]
    @positionx=args[:positionx]
    @positiony=args[:positiony]
    @width=args[:width]
    @slide_width=args[:slide_width]
    @slide_height=args[:slide_height]

    if @back_gradient_1=args[:back_gradient_1] and @back_gradient_2=args[:back_gradient_2]
      @back=""
    elsif @back_image=args[:back_image]
      @back="url('#{@back_image}')"
    elsif @back_color=args[:back_color]
      @back=@back_color
    else
      @back="white"
    end

    @text_color=args[:text_color]

    render
  end

  def panelled(args)
    @title=args[:title]
    @banner_image=args[:banner_img]
    @font_size=args[:font_size]
    @text_shadow=args[:text_shadow]
    @positionx=args[:positionx]
    @positiony=args[:positiony]
    @width=args[:width]
    @slide_width=args[:slide_width]
    @slide_height=args[:slide_height]
    @location=args[:location]

    if @back_gradient_1=args[:back_gradient_1] and @back_gradient_2=args[:back_gradient_2]
      @back=""
    elsif @back_image=args[:back_image]
      @back="url('#{@back_image}')"
    elsif @back_color=args[:back_color]
      @back=@back_color
    else
      @back="white"
    end

    @text_color=args[:text_color]
    @panel_color=args[:panel_color]
    @panel_image="url('#{args[:panel_image]}')"

    render
  end

end
