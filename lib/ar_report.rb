require "ar_report/version"
require 'yaml'
require 'settings'
require 'spreadsheet'

module ArReport
  require "railtie" if defined?(Rails)

class << self
  def start(options={})
    Settings.load!
  	generate_report
    email_report if options[:mail]
    schedule_report if options[:schedule]
  end

  private
  def generate_report
    begin
      p 'Generating excel report...'
      book = Spreadsheet::Workbook.new
      get_valid_model_names.each do |class_name_str|
        p 'Exporting.. '+ class_name_str.pluralize
        sheet = book.create_worksheet :name => class_name_str
        class_name=class_name_str.constantize
        columns=class_name.column_names
        columns.each { |x| sheet.row(0).push x}
   
        class_eval(class_name_str).all.each_with_index do |record,i|
          row_values =[] 
    
          columns.each do |column|
            row_values << record.send(column)
          end
        
          row_values.each { |x|sheet.row(i+1).push x}
        end
      end
      spreadsheet = StringIO.new 
      p "Report Generated at 'public/#{get_file_name}'. Thankyou for using Ar_Report.!"
      book.write "public/#{get_file_name}"
    rescue
    #   raise "ArReport::Error: No models specified. Please add model names to config/ar_report.yml"
    end


  end

  def email_report
    raise "ArReport::Error: Please specify report_to and report_from email addresses in config/ar_report.yml" if (Settings.ar_report[:report_from].nil? || Settings.ar_report[:report_to].nil? )
    
    file_name=get_file_name
    mail = Mail.new do
      from Settings.ar_report[:report_from]
      to Settings.ar_report[:report_to]
      subject Settings.ar_report[:report_to]
      attachments[file_name] = File.read("#{Rails.root}/public/#{file_name}")
    end
    mail.deliver!
  end

  def get_valid_model_names
    raise "No models specified. Please add model names to config/ar_report.yml" if Settings.ar_report[:models].nil?
    Settings.ar_report[:models].gsub(/\s+/, "").split(',').delete_if{|a| class_eval(a).superclass!=ActiveRecord::Base rescue true}
  end

  def get_file_name
    (Settings.ar_report[:file_name] || "ar_report_#{Date.today}") + '.xls'
  end
end

end







