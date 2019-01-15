class DucksController < ApplicationController

  def index
    @ducks = Duck.all
  end

  def new
    @duck = Duck.new
    @students = Student.all
  end

  def create
    @duck = Duck.new(duck_params)
    if @duck.valid?
      @duck.save
      redirect_to duck_path(@duck)
    else
      @students = Student.all
      render :edit
    end
  end

  def show
    @duck = Duck.find(params[:id])
    @student = @duck.student
  end

  def edit
    @duck = Duck.find(params[:id])
    @student = @duck.student
    @students = Student.all
  end

  def update
    @duck = Duck.find(params[:id])
    @duck.assign_attributes(duck_params)
    if @duck.valid?
      @duck.save
      redirect_to duck_path(@duck)
    else
      @student = @duck.student
      @students = Student.all
      render :edit
    end
  end

  private
  def duck_params
    params.require(:duck).permit(:name, :description, :student_id)
  end

end
