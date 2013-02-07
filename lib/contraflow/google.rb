module RTWorkflow
  class Google

    require 'google_drive'
    require 'highline/import'
    require 'erb'
    require 'pp'
    

    attr_accessor :user, :password, :document, :sheets, :spreadsheet, :session, :data

    def initialize config, msg="Enter your Google user name and password:"
      say msg unless config[:pass]
      
      @user = config[:user] || ask("Enter your username:  ") 
      @pass = config[:pass] || ask("Enter your password:  ") { |q| q.echo = "*" }

      @document = config[:document]
      @sheets   = config[:sheets]
      @spreadsheet, @data = nil, { }
      @session = GoogleDrive.login(@user, @pass)
      abort "Can not connect to Google Drive" if @session.nil?
    end

    # Read the data from Google doc and create hash for each defined worksheet.
    def read

      @spreadsheet = session.file_by_title(@document)

      abort "Can not read spreadsheet" if @spreadsheet.nil?
      
      @sheets.each do |tab_name|
        dt = @spreadsheet.worksheet_by_title(tab_name).rows.dup

        title = dt.shift
        @data[tab_name] = { :title => title, :rows => dt }
      end

      self
    end

  end
end
