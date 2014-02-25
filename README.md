# ArReport

[![Gem Version](https://badge.fury.io/rb/ar_report.png)](http://badge.fury.io/rb/ar_report)

Install, Generate and email.. cant get simpler than this.. Generate basic ActiveRecord Report with ease. 


## Installation

Add this line to your application's Gemfile:

    gem 'ar_report'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ar_report

## Usage

This gem uses the spreadsheet and mail gem to send out reports to a email specified email address.

Once you install the gem, Use it as follows.

Run, 

	$ rails g ar_report:install

This will generate a config/ar_report.yml in your application directory. 

When you open this file, you can specify various options fir your report like models, report_name, report_from and report_to. Following is the structure for the yml: 
<pre>
	ar_report: 
	  models: #specify model name here for eg 'User' or array of models ['User', 'Post'] 

          file_name: #specify name of the xls report to be attached  

          report_from: # specify email address of user from which you want to send the email. 

          report_to:   # specify email address of users/group to whom you want to send an email to. 
</pre>

Fill in al the required details and.. hey.. you are done..! 

Just run the rake provided by the gem:

    $ rake ar_report:generate 

 This will generate a xls file in your public folder. 

You could also run:

    $ rake ar_report:generate_and_email 

 This will not only generate an xls fie but will also mail it to the emai address specified in the ar_report.yml file.

 Note: This gem depends on Mail gem to send out emails. So, Please specify the configs for the mail gem. Refer https://github.com/mikel/mail for details. 

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

#ToDo 

Specs.

:collision: :collision: :collision:
