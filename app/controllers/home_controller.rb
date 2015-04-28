class HomeController < ApplicationController
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

        flash[:notice] = 'Sua pré-matricula foi enviada!'
        format.html { redirect_to root_url + '#preregister-form' }
        format.json { render json: @student, status: :created, location: @student }
      else
        format.html { render action: "index" }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  private 

  def permitted_params
    params.require(:student).permit(:name, :email, :ocuppation, :phone, :cell_phone)
  end
end
