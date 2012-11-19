class ConceptsController < ApplicationController

  def index
    @concepts = Concept.all
    @concept = Concept.new

  end

  def show

    @concept = Concept.find(params[:id])

  end

  def new
    @concept = Concept.new

  end

  def create
    @concept = Concept.new(params[:concept])
    if @concept.save
      if !params[:integrated_view].nil?
        redirect_to concept_dashboard_path, :notice => "Successfully created concept."
      else
        redirect_to concepts_url, :notice => "Successfully created concept."
      end
    else
      render :new
    end
  end

  def edit
    @concept = Concept.find(params[:id])
    if !params[:get].nil?
      render :layout => false
    end
  end

  def update
    @concept = Concept.find(params[:id])
    if @concept.update_attributes(params[:concept])
      if !params[:integrated_view].nil?
        redirect_to concept_dashboard_path, :notice => "Successfully created concept."
      else
        redirect_to concepts_url, :notice => "Successfully created concept."
      end


    else
      render :edit
    end
  end

  def destroy
    @concept = Concept.find(params[:id])
    @concept.destroy
    if !params[:integrated_view].nil?

      redirect_to concept_dashboard_path, :notice => "Successfully destroyed concept."
    else
      redirect_to concepts_url, :notice => "Successfully destroyed concept."
    end
  end

  def parse_save_from_excel
    test_file = params[:excel_file]
    file = FileUploader.new
    if file.store!(test_file)
      book = Spreadsheet.open "#{file.store_path}"
      sheet1 = book.worksheet 0

      @concept = []
      @errors = Hash.new
      @counter = 0

      sheet1.each 1 do |row|
        @counter+=1
        p = Concept.new

        p.name = row[0]
        unless Concept.find_by_name(p.name)
          if p.valid?
            p.save
          else
            @errors["#{@counter+1}"] = p.errors
          end
        end
      end
      file.remove!
      if @errors.empty?
        redirect_to concept, notice: 'All Dummy data were successfully uploaded.'
      else
        redirect_to concept, notice: 'There were some errors in your upload'
      end

    else
      redirect_to concept, notice: 'Dummy datum could not be successfully uploaded.'
    end
  end

  def dashboard
    @concepts = Concept.all
    @concept = Concept.new

  end
end
