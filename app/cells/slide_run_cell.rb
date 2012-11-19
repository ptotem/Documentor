class SlideRunCell < Cell::Rails
     def run_slide(args)
           @title=args[:title]
           @slide_width=args[:slide_width]
           @slide_height=args[:slide_height]
           @images=args[:images]
           @font_size=args[:font_size]


     if @back_gradient_1=args[:back_gradient_1] and @back_gradient_2=args[:back_gradient_2]
      @back=""
    elsif @back_image=args[:back_image]
      @back="url('#{@back_image}')"
    elsif @back_color=args[:back_color]
      @back=@back_color
    else
      @back="white"
    end
       render
     end
end
