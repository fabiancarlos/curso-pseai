class PreRegistration < ApplicationMailer
	def register_email(user)
    @user = user
    @url  = 'http://cursopseai.com.br'
    mail(to: @user.email, subject: 'Pré-Matriacula | Curso PS e AI')
  end
end
