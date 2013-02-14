class WeighInsController < ApplicationController
  # GET /weigh_ins/1/edit
  def edit
    @weigh_in = WeighIn.find(params[:id])
  end

  # POST /weigh_ins
  # POST /weigh_ins.json
  def create
    redirect_location = root_url
    if params[:weigh_in].has_key? :redirect_location
      redirect_location = params[:weigh_in][:redirect_location]
      params[:weigh_in].delete :redirect_location
    end
    
    @weigh_in = WeighIn.new(params[:weigh_in])

    respond_to do |format|
      if @weigh_in.save
        format.html { redirect_to redirect_location, notice: 'Weigh in was successfully created.' }
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
        format.html { redirect_to @weigh_in.person, notice: 'Weigh in was successfully updated.' }
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
      format.html { redirect_to @weigh_in.person }
      format.json { head :no_content }
    end
  end
end
