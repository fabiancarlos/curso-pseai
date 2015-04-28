class PreRegistration < ApplicationMailer
	def register_email(user)
    @user = user
    @url  = 'http://cursopseai.com.br'
    mail(to: 'cursopseai@gmail.com', subject: 'Pré-Matriacula | Curso PS e AI')
  end
end
