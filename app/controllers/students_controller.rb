class StudentsController < ApplicationController
  before_action :find_student, only: [:show, :edit, :update, :destroy]
  
  def index
    @students = Student.active
  end
  
  def show
  end

  def new
    @student = Student.new
  end

  def edit  
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      redirect_to @student, notice: 'Student was successfully created.'
    else
      render :new
    end    
  end

  def update
    if @student.update(student_params)
      redirect_to @student, notice: 'Student was successfully updated.'
    else
      render :edit
    end    
  end

  def destroy
    @student.update_attribute('deleted',true)
    redirect_to students_url, notice: 'Student was successfully destroyed.'
  end

  private
    
    def find_student
      @student = Student.where(params[:id]).first
      rescue ActiveRecord::RecordNotFound
			  flash[:notice] = "Student not found."
			  redirect_to :action => 'index'
    end

    
    def student_params
      params.require(:student).permit(:enroll_no, :first_name, :last_name, :email, :gender, :date_of_birth, :phone, :address1, :address2, :city, :country, :postcode, :avatar, :status)
    end
end