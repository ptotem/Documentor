class PhotoAndBulletListCell < Cell::Rails

  def no_anim(args)
    @slide_width=args[:slide_width]
    @slide_height=args[:slide_height]
    @title=args[:title]
    @banner_image=args[:banner_img]
    @list_items=args[:list_items]
    @font_size=args[:font_size]
    @bullet_image=args[:bullet_img]
    @bullet_size=@font_size

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

  def no_anim_flipped(args)
    @slide_width=args[:slide_width]
    @slide_height=args[:slide_height]
    @title=args[:title]
    @banner_image=args[:banner_img]
    @list_items=args[:list_items]
    @font_size=args[:font_size]
    @bullet_image=args[:bullet_img]
    @bullet_size=@font_size

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


  def sliding_anim(args)
    @slide_width=args[:slide_width]
    @slide_height=args[:slide_height]
    @title=args[:title]
    @banner_image=args[:banner_img]
    @list_items=args[:list_items]
    @font_size=args[:font_size]
    @bullet_image=args[:bullet_img]
    @bullet_size=@font_size

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

  def sliding_anim_flipped(args)
    @slide_width=args[:slide_width]
    @slide_height=args[:slide_height]
    @title=args[:title]
    @banner_image=args[:banner_img]
    @list_items=args[:list_items]
    @font_size=args[:font_size]
    @bullet_image=args[:bullet_img]
    @bullet_size=@font_size

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
