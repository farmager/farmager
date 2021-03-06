class FieldsController < ApplicationController

  before_action :signed_in_user
  before_action :clear_search_index, :only => [:index]
  def table
    @search = current_user.fields.search(params[:q])
    @fields = @search.result
    @fields = current_user.fields.paginate(page: params[:page])
    respond_to do |format|
      format.html
      format.xls
      format.csv do
        render_csv("fields-#{Time.now.strftime("%Y%m%d")}")
      end
    end
  end

  def graph
    @fields = current_user.fields.paginate(page: params[:page])
  end

  def index

    @search = current_user.fields.search(search_params)
    @search.sorts = 'year desc' if @search.sorts.empty?
    @fields = @search.result().page(params[:page])
    @search.build_condition

  end

  def new
    @field=Field.new

    @test = current_user.fields.all
    respond_to do |format|
      format.html
      format.json { render :json => @test  }
    end

  end

  def edit
    @field = Field.find(params[:id])
  end

  def update
    @field = Field.find(params[:id])
    if @field.update_attributes(field_params)
      flash[:success] = "Field updated"
      redirect_to @field
    else
      render 'field'
    end
  end

  def destroy
    Field.find(params[:id]).destroy
    flash[:success] = "Field deleted."
    redirect_to fields_url

  end

  def show
    @field = Field.find(params[:id])
  end

  def create
    @field = current_user.fields.build(field_params)
    if @field.save
      flash[:success] = "Field added successfully!"
      redirect_to @field
    else
      render 'new'
    end
  end

  private

  def field_params
    params.require(:field).permit(:year,:seeded_acres,:netyield,:grade,:production,:notes,:land_location,:land_name,:crop_type,:variety,:seeding_date,:f_nitrogen,:f_phosphorous,:f_sulphur,:f_potassium,:herbicides,:fungicides)
  end

end