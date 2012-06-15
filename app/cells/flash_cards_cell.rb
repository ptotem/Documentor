class FlashCardsCell < Cell::Rails

  def full_slide(args)
    @title=args[:title]
    @slide_width=args[:slide_width]
    @slide_height=args[:slide_height]
    @table_height=args[:table_height]
    @table_width=args[:table_width]
    @font_size=args[:font_size]
    @flip_images=args[:flip_images]
    @cols=args[:cols]
    @rows=args[:rows] ||= 1

    if args[:flip_style]=="horizontal"
      @left_right=true
    else
      @left_right=false
    end

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

  def with_text(args)
    @title=args[:title]
    @slide_width=args[:slide_width]
    @slide_height=args[:slide_height]
    @slide_text=args[:slide_text]
    @text_width=args[:text_width]
    @table_height=args[:table_height]
    @table_width=args[:table_width]
    @font_size=args[:font_size]
    @flip_images=args[:flip_images]
    @cols=args[:cols]
    @rows=args[:rows] ||= 1

    if args[:flip_style]=="horizontal"
      @left_right=true
    else
      @left_right=false
    end

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

  def with_bullets(args)
    @title=args[:title]
    @slide_width=args[:slide_width]
    @slide_height=args[:slide_height]
    @slide_text=args[:slide_text]
    @text_width=args[:text_width]
    @table_height=args[:table_height]
    @table_width=args[:table_width]
    @font_size=args[:font_size]
    @flip_images=args[:flip_images]
    @cols=args[:cols]
    @rows=args[:rows] ||= 1

    @list_items=args[:list_items]
    @bullet_image=args[:bullet_img]
    @bullet_size=@font_size


    if args[:flip_style]=="horizontal"
      @left_right=true
    else
      @left_right=false
    end

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

end
