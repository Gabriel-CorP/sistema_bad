# Preview all emails at http://localhost:3000/rails/mailers/post_mailer
class PostMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/post_mailer/post_created
  def post_created
    @usuario_logeado="gabrielcorena@gmail.com"
    @cotizacion="smart watch 5 pulg 10 unidades \n smart TV 55 pulg 10 unidades "
    PostMailer.with(user: @usuario_logeado, contenido: @cotizacion).post_created
  end

end
