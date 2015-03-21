class Contact < MailForm::Base
  attribute :name, :validate => true
  attribute :email, :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :website
  attribute :message
  attribute :nickname, :captcha => true

  def headers
    {
      :subject => "Contact Form",
      :to => "wendybeth010@gmail.com",
      :from => %("#{name}" <#{email}>)
    }
  end
end
