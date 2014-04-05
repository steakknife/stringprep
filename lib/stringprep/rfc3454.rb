autoload :FileUtils, 'fileutils'
autoload :JSON,      'json'

module Stringprep
  module Rfc3454

    # Loads code point tables from data/rfc3454.json, creates it if it does not exist
    def self.tables
      tries = READ_RETRIES
      @tables ||= begin
        raw_read_tables
      rescue Errno::ENOENT
        write_tables(parse_rfc_txt)
        retry if (tries -= 1) > 0
        raise
      end
    end

  private

    TABLES_DATA_DIR = 'data'
            RFC_DIR = 'data'
    TABLES_FILE = File.join(TABLES_DATA_DIR, 'rfc3454.json')
    RFC_FILE = File.join(TABLES_DATA_DIR, 'rfc3454.txt')


    START_TABLE = /^[[:space:]]*----- Start Table ([^-]*) -----[[:space:]]*$/
    END_TABLE = /^[[:space:]]*----- End Table ([^-]*) -----[[:space:]]*$/
    DATA_LINE = /[[:xdigit:]]{2}/
    SKIP_LINE = /Standards Track|RFC /
    READ_RETRIES = 4

    def self.raw_read_tables
      JSON.parse(File.read(TABLES_FILE))
    end

    def self.parse_rfc_txt
      tables = {}
      table_name = nil
      started = false
      File.readlines(RFC_FILE).each do |line|
        if line =~ START_TABLE
          started = true
          table_name = $1.gsub('.', '').downcase
          tables[table_name] = []
        elsif line =~ END_TABLE
          started = false
        elsif started && line =~ DATA_LINE && line !~ SKIP_LINE
          tables[table_name] << line.strip
        end
      end
      tables
    end

    def self.write_tables(tables)
      FileUtils.mkdir_p TABLES_DATA_DIR
      File.open(TABLES_FILE, 'w') { |f|
        f.write(JSON.generate(tables))
      }
    end
  end
end
