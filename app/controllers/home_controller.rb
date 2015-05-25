class HomeController < ApplicationController

  before_filter :options_form

  def index
  	@student = Student.new
  	@url = pre_register_path
  end

  def create
  	@student = Student.new(permitted_params)
  	@url = pre_register_path

  	puts @student.to_json

    respond_to do |format|
      if @student.valid?

      	PreRegistration.register_email(@student).deliver

        flash[:notice] = 'Sua matricula foi enviada!'
        format.html { redirect_to root_url + '#preregister-form' }
        format.json { render json: @student, status: :created, location: @student }
      else
        format.html { render action: "index" }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  private 

  def options_form
    @date_course_options = {
      'Data'     =>  '',
      '8 de Junho, Segunda a Sexta'     => '8 de Junho, Segunda a Sexta',
      '12 de Junho, Todos os Sabados'   => '12 de Junho, Todos os Sabados'
    }

    @hour_course_options = {
      'Horário'     =>  '',
      '15:00 às 18:00'  => '15:00 às 18:00',
      '19:00 às 22:00'  => '19:00 às 22:00',
      '08:00 às 11:00'  => '08:00 às 11:00',
      '13:00 às 16:00'  => '13:00 às 16:00',
      '18:00 às 21:00'  => '18:00 às 21:00'
    }
  end

  def permitted_params
    params.require(:student).permit(:name, :email, :ocuppation, :phone, :cell_phone, :date_course, :hour_course)
  end
end
