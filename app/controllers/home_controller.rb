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
      '29 de Junho, Segunda a Sexta'     => '29 de Junho, Segunda a Sexta',
      '4 de Julho, Todos os Sábados'   => '4 de Julho, Todos os Sábados'
    }

    @hour_course_options = {
      'Horário'     =>  '',
      '15:00 às 18:00 Seg a Sex'  => '15:00 às 18:00 Seg a Sex',
      '19:00 às 22:00 Seg a Sex'  => '19:00 às 22:00 Seg a Sex',
      '08:00 às 11:00 Sáb'  => '08:00 às 11:00 Sáb',
      '13:00 às 16:00 Sáb'  => '13:00 às 16:00 Sáb',
      '18:00 às 21:00 Sáb'  => '18:00 às 21:00 Sáb'
    }
  end

  def permitted_params
    params.require(:student).permit(:name, :email, :ocuppation, :phone, :cell_phone, :date_course, :hour_course)
  end
end
