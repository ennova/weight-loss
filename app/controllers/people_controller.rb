class PeopleController < ApplicationController
  # GET /people
  # GET /people.json
  def index
    @people = Person.all
    @weigh_in = WeighIn.new

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @people }
    end
  end

  # GET /people/1
  # GET /people/1.json
  def show
    @person = Person.find(params[:id])
    @chart = weight_chart(@person)
    @weigh_in = WeighIn.new

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @person }
    end
  end

  # GET /people/new
  # GET /people/new.json
  def new
    @person = Person.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @person }
    end
  end

  # GET /people/1/edit
  def edit
    @person = Person.find(params[:id])
  end

  # POST /people
  # POST /people.json
  def create
    @person = Person.new(params[:person])

    respond_to do |format|
      if @person.save
        format.html { redirect_to root_url, notice: 'Person was successfully created.' }
        format.json { render json: @person, status: :created, location: @person }
      else
        format.html { render action: "new" }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /people/1
  # PUT /people/1.json
  def update
    @person = Person.find(params[:id])

    respond_to do |format|
      if @person.update_attributes(params[:person])
        format.html { redirect_to root_url, notice: 'Person was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /people/1
  # DELETE /people/1.json
  def destroy
    @person = Person.find(params[:id])
    @person.destroy

    respond_to do |format|
      format.html { redirect_to people_url }
      format.json { head :no_content }
    end
  end

  private
    def weight_chart(person)
      data_table = GoogleVisualr::DataTable.new
      data_table.new_column('date', 'Date')
      data_table.new_column('number', 'Weight')
      data_table.add_rows(person.weigh_ins.count)
      
      person.weigh_ins.order('date').each_with_index  do |weigh_in, index|
        data_table.set_cell(index, 0, weigh_in.date)
        data_table.set_cell(index, 1, weigh_in.weight)
      end

      opts = { height: 400, title: 'Weight lost over time', pointSize: 5 }
      chart = GoogleVisualr::Interactive::AreaChart.new(data_table, opts)
    end
end
