class DocuchecksController < ApplicationController
  # GET /docuchecks
  # GET /docuchecks.json
  def index
    @docuchecks = Docucheck.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @docuchecks }
    end
  end

  # GET /docuchecks/1
  # GET /docuchecks/1.json
  def show
    @docucheck = Docucheck.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @docucheck }
    end
  end

  # GET /docuchecks/new
  # GET /docuchecks/new.json
  def new
    @docucheck = Docucheck.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @docucheck }
    end
  end

  # GET /docuchecks/1/edit
  def edit
    @docucheck = Docucheck.find(params[:id])
  end

  # POST /docuchecks
  # POST /docuchecks.json
  def create
    @docucheck = Docucheck.new(params[:docucheck])

    respond_to do |format|
      if @docucheck.save
        format.html { redirect_to @docucheck, notice: 'Docucheck was successfully created.' }
        format.json { render json: @docucheck, status: :created, location: @docucheck }
      else
        format.html { render action: "new" }
        format.json { render json: @docucheck.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /docuchecks/1
  # PUT /docuchecks/1.json
  def update
    @docucheck = Docucheck.find(params[:id])

    respond_to do |format|
      if @docucheck.update_attributes(params[:docucheck])
        format.html { redirect_to @docucheck, notice: 'Docucheck was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @docucheck.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /docuchecks/1
  # DELETE /docuchecks/1.json
  def destroy
    @docucheck = Docucheck.find(params[:id])
    @docucheck.destroy

    respond_to do |format|
      format.html { redirect_to docuchecks_url }
      format.json { head :no_content }
    end
  end
end
