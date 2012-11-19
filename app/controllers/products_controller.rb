class ProductsController < ApplicationController

  def index
    @products = Product.all
    @product = Product.new

  end

  def show

    @product = Product.find(params[:id])

  end

  def new
    @product = Product.new

  end

  def create
    @product = Product.new(params[:product])
    if @product.save
      if !params[:integrated_view].nil?
        redirect_to product_dashboard_path, :notice => "Successfully created product."
      else
        redirect_to products_url, :notice => "Successfully created product."
      end
    else
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
    if !params[:get].nil?
      render :layout => false
    end
  end

  def update
    @product = Product.find(params[:id])
    if @product.update_attributes(params[:product])
      if !params[:integrated_view].nil?
        redirect_to product_dashboard_path, :notice => "Successfully created product."
      else
        redirect_to products_url, :notice => "Successfully created product."
      end


    else
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    if !params[:integrated_view].nil?

      redirect_to product_dashboard_path, :notice => "Successfully destroyed product."
    else
      redirect_to products_url, :notice => "Successfully destroyed product."
    end
  end

  def parse_save_from_excel
    test_file = params[:excel_file]
    file = FileUploader.new
    if file.store!(test_file)
      book = Spreadsheet.open "#{file.store_path}"
      sheet1 = book.worksheet 0

      @product = []
      @errors = Hash.new
      @counter = 0

      sheet1.each 1 do |row|
        @counter+=1
        p = Product.new

        p.name = row[0]
        unless Product.find_by_name(p.name)
          if p.valid?
            p.save
          else
            @errors["#{@counter+1}"] = p.errors
          end
        end
      end
      file.remove!
      if @errors.empty?
        redirect_to product, notice: 'All Dummy data were successfully uploaded.'
      else
        redirect_to product, notice: 'There were some errors in your upload'
      end

    else
      redirect_to product, notice: 'Dummy datum could not be successfully uploaded.'
    end
  end

  def dashboard
    @products = Product.all
    @product = Product.new

  end
end
