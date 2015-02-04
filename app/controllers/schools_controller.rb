class SchoolsController < ApplicationController
  def index
    @schools = School.all
  end

  def new
    @school = School.new
  end

  def create
    @school = School.new(school_params)
    if @school.save
      redirect_to school_url(@school)
    else
      flash.now[:errors] = @school.errors.full_messages
      render :new
    end
  end

  def show
    @school = School.find(params[:id])
  end

  private

  def school_params
    params.require(:school).permit(:name)
  end

end
