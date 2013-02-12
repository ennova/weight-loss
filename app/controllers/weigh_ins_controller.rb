class WeighInsController < ApplicationController
  # GET /weigh_ins
  # GET /weigh_ins.json
  def index
    @weigh_ins = WeighIn.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @weigh_ins }
    end
  end

  # GET /weigh_ins/1
  # GET /weigh_ins/1.json
  def show
    @weigh_in = WeighIn.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @weigh_in }
    end
  end

  # GET /weigh_ins/new
  # GET /weigh_ins/new.json
  def new
    @weigh_in = WeighIn.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @weigh_in }
    end
  end

  # GET /weigh_ins/1/edit
  def edit
    @weigh_in = WeighIn.find(params[:id])
  end

  # POST /weigh_ins
  # POST /weigh_ins.json
  def create
    @weigh_in = WeighIn.new(params[:weigh_in])

    respond_to do |format|
      if @weigh_in.save
        format.html { redirect_to @weigh_in, notice: 'Weigh in was successfully created.' }
        format.json { render json: @weigh_in, status: :created, location: @weigh_in }
      else
        format.html { render action: "new" }
        format.json { render json: @weigh_in.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /weigh_ins/1
  # PUT /weigh_ins/1.json
  def update
    @weigh_in = WeighIn.find(params[:id])

    respond_to do |format|
      if @weigh_in.update_attributes(params[:weigh_in])
        format.html { redirect_to @weigh_in, notice: 'Weigh in was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @weigh_in.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /weigh_ins/1
  # DELETE /weigh_ins/1.json
  def destroy
    @weigh_in = WeighIn.find(params[:id])
    @weigh_in.destroy

    respond_to do |format|
      format.html { redirect_to weigh_ins_url }
      format.json { head :no_content }
    end
  end
end
