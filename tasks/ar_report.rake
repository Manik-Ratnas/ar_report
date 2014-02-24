# Author Manish Puri
# Task to setup mailer
namespace :ar_report do
  task :generate => :environment do
     ArReport.start
  end

  task :generate_and_mail => :environment do
    p 'Please note ar_report relies on mail gem to send out emails. Please make sure you have specified the SMTP settings 
       as required by the mail gem.'
     ArReport.start(:mail=>true)
  end

end
