require 'stringprep/table/base'

module Stringprep
  module Table
    class Map < Base
      def initialize(data)
        @codes = Map.parse(data)
      end

      def map(code)
        if string_char = ((code.is_a?(String)) && (code.length == 1))
          code = code.unpack('U')[0]
        end
        return unless code.class < Integer
        new_code = @codes[code] || code
        if string_char
          if new_code.is_a?(Array)
            new_code = new_code.pack('U*')
          else
            new_code = [new_code].pack('U') if !new_code.nil?
          end
        end
        new_code
      end

    private
      def self.parse(data)
        Hash[ data.map { |line|
          parse_line(line).tap { |x|
            raise "Parse error '#{line}'" if x.nil?
          }
        }]
      end

      def self.parse_line(line)
        parse_map_to_nothing(line) || parse_case_map(line)
      end

      def self.parse_map_to_nothing(line)
        if line =~ /([[:xdigit:]]+);[[:space:]]*;[[:space:]]*/
          [ $1.to_i(16), nil ]
        end
      end

      def self.parse_case_map(line)
        if r = line.match(/([[:xdigit:]]+);(?:[[:space:]]*([[:xdigit:]]+))+;[[:space:]]*/)
          [ r[1].to_i(16), r[2..-1].map { |x| x.to_i(16) } ]
        end
      end
    end
  end
end

