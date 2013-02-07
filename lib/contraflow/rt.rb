module RTWorkflow
  class RT
    require 'mysql2'

    # Opens connection to MySQL RT database and sets some initial
    # values for things.
    #
    # @param [Hash] config Hash with MySQL connections information, keys are
    #     :server, :db, :user, :password
    #
    # == Example
    #    config = { 
    # 
    #     :host => "rt.company.com",
    #     :database => 'rt',
    #     :username => 'db_user',
    #     :password => 'SECRET'
    #    },

    def initialize config
      @config = config
      #begin
        @db = Mysql2::Client.new config[:db]
        abort "Cannot connect to MySQL" if @db.nil?
#       rescue => e 
#         "Cannot connect #{e.message}"
#       end

      @template_name = nil
      @template_text = nil
    end

    attr_accessor :db, :config

    # RT template for update: name and actual text
    attr_accessor :template_name, :template_text

    # Update custom template in MySQL RT database
    #
    # @param [String] name Name of the template
    # @param [String] text test of the template

    def update
      
      if @template_text.strip.empty? || @template_name.strip.empty?
        abort "Neither data or template name can be empty" 
      else
        @db.query "UPDATE Templates SET Content = '#{@template_text}' WHERE name = '#{@template_name}'"
      end

      self
    end

    # Build formatted tickets list using ERB template and data from
    # spreadsheet.
    #
    # @param [String] name Name of the RT Template, it has the same
    #     name as Google Doc worksheet name.
    #
    # @param [Hash] data Has keys :title, :rows
    #
    def build name, data
      res, @task, @id = '', { }, 0


      @template_name = db.escape(name)

      base = File.expand_path('../../', __FILE__)
      file = "#{base}/#{config[:erb]}/#{name}.erb"

      erb = ERB.new File.read(File.expand_path(file))

      data[:rows].each do |row|
        @id += 1 
        data[:title].each_index do |idx|
          row[idx].strip!
          @task[data[:title][idx]] = row[idx].empty? ? nil : row[idx]
        end
        res << erb.result(binding)
      end
      @template_text = @db.escape res
      
      self
    end # build

  end
end
