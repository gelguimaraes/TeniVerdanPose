class NewUserEmailMailer < ApplicationMailer
  default :from => @indicator.email
  def mail_to_indicated(indicator, indicated, movie, plataforma)
    @indicator = indicator
    @indicated = indicated
    @movie = movie
    @plataforma = plataforma
    @base_url = "https://teniverdanpose.herokuapp.com/"
    mail(to: @indicated.email, subject: ('Seu amigo ' + @indicator.nome + ' te indicou um filme' ))
  end
end
