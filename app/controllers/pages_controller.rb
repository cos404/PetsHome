class PagesController < ApplicationController

  def contacts
    ## complete
  end

  def terms
    ## complete
  end

  def about
    ## complete
  end

  def sitemap
  end

  def press
  end

  def send_mail
    data = params[:message]
    subject = params[:subject]
    user = params[:email]
    ContactMailer.mail_method(data,user,subject).deliver
    redirect_to contacts_path, notice: 'Message sent.'
  end

end
