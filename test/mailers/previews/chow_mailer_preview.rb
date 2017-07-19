# Preview all emails at http://localhost:3000/rails/mailers/chow_mailer
class ChowMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/chow_mailer/chowdown_request
  def chowdown_request
    ChowMailer.chowdown_request
  end

  # Preview this email at http://localhost:3000/rails/mailers/chow_mailer/chowdown_accepted
  def chowdown_accepted
    ChowMailer.chowdown_accepted
  end

  # Preview this email at http://localhost:3000/rails/mailers/chow_mailer/chowdown_details
  def chowdown_details
    ChowMailer.chowdown_details
  end

end
