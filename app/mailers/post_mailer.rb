class PostMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.post_mailer.post_created.subject
  #
  def post_created
    
    @user= params[:user]
    @cotizacion= params[:contenido]
    @greeting = @cotizacion

    mail from: "la.nueva.empresa.bad@gmail.com", to: @user, subject: "Cotización aprobada", body: @cotizacion
  end
end
