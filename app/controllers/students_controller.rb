class StudentsController < ApplicationController

  def index
    @students = Student.all
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    if @student.valid?
      @student.save
      redirect_to student_path(@student)
    else
      render :new
    end
  end

  def show
    @student = Student.find(params[:id])
    @ducks = @student.ducks
  end

  def edit
    @student = Student.find(params[:id])
  end

  def update
    @student = Student.find(params[:id])
    @student.assign_attributes(student_params)
    if @student.valid?
      @student.save
      redirect_to student_path(@student)
    else
      render :edit
    end
  end

  private
  def student_params
    params.require(:student).permit(:name, :mod)
  end

end
